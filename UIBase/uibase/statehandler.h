#ifndef STATEHANDLER_H
#define STATEHANDLER_H

#include "statelistcolor.h"

#include <QObject>

class QQuickItem;

class StateHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int states READ states NOTIFY statesChanged)

public:
    enum State {
        Normal = 0,
        Enabled = 1,
        Checked = 2,
        Pressed = 4,
        Hovered = 8,
        HalfChecked = 16,
        Selected = 32,
        Disabled = 1 << 16,
        NotEnabled = 1 << 16,
        NotChecked = 2 << 16,
        NotPressed = 4 << 16,
        NotHovered = 8 << 16,
    };

    Q_FLAG(State)

public:
    explicit StateHandler(QObject *parent = nullptr);

    static StateHandler* bindTo(QObject *parent);

signals:
    void statesChanged(int states);

public:
    int states() const;

public slots:
    StateColor * mapColor(StateListColor * color);

private:
    void onEnabledChanged();

private slots:
    void onCheckedChanged();

    void onPressedChanged();

    void onHoveredChanged();

private:
    void onStateChanged(State state, bool value);

    void bindTo(QQuickItem * item);

private:
    int states_ = 0;
    QQuickItem * item_;
    QObject * tapHandler_;
    QObject * hoverHandler_;
    QList<QMetaObject::Connection> conns_;
};

#endif // STATEHANDLER_H
