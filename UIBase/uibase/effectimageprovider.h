#ifndef EFFECTIMAGEPROVIDER_H
#define EFFECTIMAGEPROVIDER_H

#include <QQuickImageProvider>
#include <QNetworkAccessManager>

class EffectImageProvider : public QQuickAsyncImageProvider
{
public:
    explicit EffectImageProvider();

    QQuickImageResponse * requestImageResponse(const QString &id, const QSize &requestedSize) override;

private:
    QNetworkAccessManager * network_ = nullptr;
};

#endif // EFFECTIMAGEPROVIDER_H
