#include "effectimageprovider.h"

#include <QRegularExpression>
#include <QUrlQuery>
#include <QNetworkReply>
#include <QWaitCondition>
#include <QPainter>
#include <QEvent>
#include <QCoreApplication>
#include <QImageReader>

EffectImageProvider::EffectImageProvider()
    : network_(new QNetworkAccessManager)
{
}

class EffectTextureFactory : public QQuickTextureFactory
{

};

class EffectImageResponse : public QQuickImageResponse
{
public:
    EffectImageResponse(QNetworkAccessManager * network, QString const & id, QSize const &requestedSize);

public:
    QQuickTextureFactory *textureFactory() const override { return QQuickTextureFactory::textureFactoryForImage(image_); }
    QString errorString() const override { return errorString_; }

public slots:
    void cancel() override {
        if (reply_)
            reply_->abort();
    }

private:
    void parseSettings(QString const & id);

    void setImage(QImage image);

private:
    QSize requestedSize_;
    QUrl realUrl_;
    qreal borderWidth_ = 0.;
    QColor borderColor_;
    qreal cornerRadius_ = 0.;
    QVector<qreal> cornerRadii_;

    QImage image_;
    QString errorString_;
    QNetworkReply * reply_;
};

QQuickImageResponse * EffectImageProvider::requestImageResponse(const QString &id, const QSize &requestedSize)
{
    int slashIndex = id.indexOf('/');
    if (slashIndex == -1)
    {
        qWarning() << "Can't parse url" << id << ". Usage is operation/<real-url>?<format>";
        return nullptr;
    }

    //Detect operation (ex. clip)
    QString operationName = id.left(slashIndex);
    if(operationName != "clip")
    {
        qWarning() << "Operation not supported: " << operationName;
        return nullptr;
    }
    return new EffectImageResponse(network_, id, requestedSize);
}

template<typename F>
struct AsyncEvent : QEvent
{
    AsyncEvent(F f) : QEvent(None), f_(f) {}
    ~AsyncEvent() { f_(); }
private:
    F f_;
};

EffectImageResponse::EffectImageResponse(QNetworkAccessManager * network, QString const & id, QSize const &requestedSize)
{
    requestedSize_ = requestedSize;
    parseSettings(id);
    if (realUrl_.isLocalFile()) {
        setImage(QImage(realUrl_.toLocalFile()));
        return;
    }
    QCoreApplication::postEvent(network, new AsyncEvent([this, network] {
        QNetworkRequest request(realUrl_);
        reply_ = network->get(request);
        QObject::connect(reply_, &QNetworkReply::finished, [this] () {
            if (reply_->error() == QNetworkReply::NoError) {
                QImageReader reader(reply_, nullptr);
                QImage image = reader.read();
                if (image.isNull()) {
                    errorString_ = reader.errorString();
                } else {
                    setImage(image);
                }
            } else {
                errorString_ = reply_->errorString();
            }
            reply_->deleteLater();
            reply_= nullptr;
            emit finished();
        });
    }));
}

void EffectImageResponse::parseSettings(QString const & id)
{
    QString url;
    int slashIndex = id.indexOf('/');
    int customSettingsIndex = id.lastIndexOf(QRegularExpression("\\?(size|borderWidth|borderColor|cornerRadius|cornerRadii)="));
    if(customSettingsIndex >= 0)
    {
        int startOfDataIndex = slashIndex + 1;
        url = id.mid(startOfDataIndex, customSettingsIndex - (startOfDataIndex));

        //The dummy option has been added due to a bug(?) of QUrlQuery
        // it could not recognize the first key-value pair provided
        QUrlQuery optionQuery("options?dummy=&" + id.mid(customSettingsIndex + 1));
        if (optionQuery.hasQueryItem("size")) {
            QStringList ints = optionQuery.queryItemValue("size").split("x");
            if (ints.size() == 2)
                requestedSize_ = QSize(ints[0].toInt(), ints[1].toInt());
            else if (ints.size() == 1)
                requestedSize_ = QSize(ints[0].toInt(), ints[0].toInt());
        }
        if (optionQuery.hasQueryItem("borderWidth"))
            borderWidth_ = optionQuery.queryItemValue("borderWidth").toDouble();

        if (optionQuery.hasQueryItem("borderColor"))
            borderColor_ = optionQuery.queryItemValue("borderColor");

        if (optionQuery.hasQueryItem("cornerRadius"))
            cornerRadius_ = optionQuery.queryItemValue("cornerRadius").toDouble();

        if (optionQuery.hasQueryItem("cornerRadii")) {
            for (auto & s : optionQuery.queryItemValue("cornerRadii").split(","))
                cornerRadii_.append(s.toDouble());
        }
    }
    else
    {
        url = id.mid(slashIndex + 1);
    }
    realUrl_ = QUrl::fromPercentEncoding(url.toUtf8()).toUtf8();
}

void EffectImageResponse::setImage(QImage image)
{
    if (requestedSize_.isEmpty())
        requestedSize_ = image.size();
    QImage output(requestedSize_, QImage::Format_ARGB32_Premultiplied);
    output.fill(0);
    QPainter painter(&output);
    QRectF rect({0, 0}, requestedSize_);
    painter.setRenderHint(QPainter::Antialiasing);
    painter.setPen(Qt::NoPen);
    painter.setBrush(Qt::black);
    painter.drawRoundedRect(rect, cornerRadius_, cornerRadius_);
    painter.setRenderHint(QPainter::Antialiasing, false);
    painter.setRenderHint(QPainter::SmoothPixmapTransform);
    painter.setCompositionMode(QPainter::CompositionMode_SourceIn);
    if (image.size() != requestedSize_) {
        image = image.scaled(requestedSize_, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    }
    painter.drawImage(rect, image, QRectF({0, 0}, image.size()));
    if (borderWidth_ > 0) {
        painter.setRenderHint(QPainter::Antialiasing);
        painter.setPen(QPen(borderColor_, borderWidth_));
        painter.setBrush(Qt::transparent);
        painter.drawRoundedRect(rect, cornerRadius_, cornerRadius_);
    }
    painter.end();
    image_ = output;
}
