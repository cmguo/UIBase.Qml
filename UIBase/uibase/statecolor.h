#ifndef STATECOLOR_H
#define STATECOLOR_H

#include "colors.h"

#include <QObject>
#include <QColor>
#include <QVector>
#include <QPair>
#include <QQmlListProperty>

class StateColorItem: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray color MEMBER color_)
    Q_PROPERTY(int states MEMBER states_)
public:
    StateColorItem();

    QByteArray color() const { return color_; }

    int states() const { return states_; }

private:
    QByteArray color_;
    int states_;
};

class StateColor: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<StateColorItem> colors READ colors)
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
        Focused = 64,
        Disabled = 1 << 16,
        NotEnabled = 1 << 16,
        NotChecked = 2 << 16,
        NotPressed = 4 << 16,
        NotHovered = 8 << 16,
        NotHalfChecked = 16 << 16,
        NotSelected = 32 << 16,
        NotFocused = 64 << 16,
    };

    Q_FLAG(State)

public:
    typedef QColor (Colors::* StdColor)(void) const;

    template<typename ...Colors>
    StateColor(QPair<Colors, int>... colors) {
        fill(colors...);
    }

    // single color
    StateColor(QColor color);

    // single color
    StateColor(StdColor color);

    // single color
    StateColor(QByteArray const & color);

signals:
    void changed();

public:
    void append(QColor color, int states);

    void append(StdColor color, int states);

    void append(QByteArray const & color, int states);

    void append(StateColorItem * item);

    void clear();

public:
    int count() const { return statesList_.size(); }

    int stdColorCnt() const { return stdColorCnt_; }

    int states() const { return states_; }

    QQmlListProperty<StateColorItem> colors();

public slots:
    QColor color();

    QColor colorForStates(int states);

private:
    template<typename Color, typename ...Colors>
    void fill(QPair<Color, int> color, QPair<Colors, int>... colors) {
        fillOne(color);
        fill(colors...);
    }

    template<typename Color>
    void fillOne(QPair<Color, int> color) {
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

#endif // STATECOLOR_H
