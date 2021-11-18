#ifndef STATELISTCOLOR_H
#define STATELISTCOLOR_H

#include "colors.h"

#include <QObject>
#include <QColor>
#include <QVector>
#include <QPair>
#include <QQmlListProperty>

class StateListColorItem: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray color MEMBER color_)
    Q_PROPERTY(int states MEMBER states_)
public:
    StateListColorItem();

    QByteArray color() const { return color_; }

    int states() const { return states_; }

private:
    QByteArray color_;
    int states_;
};

class StateListColor: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<StateListColorItem> colors READ colors)
    Q_CLASSINFO("DefaultProperty", "colors")

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
    typedef QColor (Colors::* StdColor)(void) const;

    template<typename ...Colors>
    StateListColor(QPair<Colors, int>... colors) {
        fill(colors...);
    }

    // single color
    StateListColor(QColor color);

    // single color
    StateListColor(StdColor color);

    // single color
    StateListColor(QByteArray const & color);

signals:
    void changed();

public:
    void append(QColor color, int states);

    void append(StdColor color, int states);

    void append(QByteArray const & color, int states);

    void append(StateListColorItem * item);

    void clear();

public:
    int count() const { return statesList_.size(); }

    int stdColorCnt() const { return stdColorCnt_; }

    int states() const { return states_; }

    QQmlListProperty<StateListColorItem> colors();

public slots:
    QColor color();

    QColor colorForStates(int states);

private:
    template<typename Color, typename ...Colors>
    void fill(QPair<Color, int> color, QPair<Colors, int>... colors) {
        fill(color);
        fill(colors...);
    }

    void fill(QPair<QColor, int> color) {
        append(color.first, color.second);
    }

    void fill(QPair<StdColor, int> color) {
        append(color.first, color.second);
    }

    void fill() {
    }

private:
    QVector<int> statesList_;
    QVector<QColor> colors_;
    QVector<StdColor> stdColors_;
    int stdColorCnt_ = 0;
    int states_ = 0;
};

class StateHandler;

class StateColor : public QObject
{
    Q_OBJECT

    Q_PROPERTY(StateListColor* colors READ colors WRITE setColors NOTIFY changed)
    Q_PROPERTY(QColor color READ color NOTIFY changed)
public:
    StateColor();

    StateColor(StateListColor * color, StateHandler * state);

signals:
    void changed(QColor color);

public:
    QColor color() const;

    StateListColor* colors() const;

    void setColors(StateListColor* colors);

private:
    void onStatesChanged(int states);

private:
    StateListColor * color_;
    StateHandler * state_;
};

#endif // STATELISTCOLOR_H
