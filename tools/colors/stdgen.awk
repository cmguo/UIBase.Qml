#!/usr/local/bin/gawk -F [\t] -f

BEGIN {
  props[0] = 0
  delete props[0]
  getters[0] = 0
  delete getters[0]
  values1 = "        "
  values2 = "        "
  step = 0
}

{
  if (NR == FNR) {
    if ($3 == $2) $3 = ""
    # day color, handle %
    if (match($2, /([0-9]+)%/, result) > 0) {
      p = result[1] * 255 / 100
      p = sprintf("%0.2X", p)
      c = $2
      sub("#", "0x" p, $2)
      sub(/ \w+%/, "", $2)
    } else {
      c = $2
      sub("#", "0xFF", $2)
    }
    # night color, handle %
    if (match($3, /([0-9]+)%/, result) > 0) {
      p = result[1] * 255 / 100
      p = sprintf("%0.2X", p)
      c = c " | " $3
      sub("#", "0x" p, $3)
      sub(/ \w+%/, "", $3)
    } else if ($3 != "") {
      c = c " | " $3
      sub("#", "0xFF", $3)
    }
    if ($4 != "") c = c " " $4
    if (c != "") c = "  // " c
    if ($1 != "" && substr($2, 1, 2) == "0x") {
      if (substr($3, 1, 2) == "0x" && $3 != $2) {
        props[length(props)] = "    Q_PROPERTY(QColor " $1 " READ " $1 " NOTIFY changed)" c
        getters[length(getters)] = "    QColor " $1 "() const { return colors[" length(getters) "]; }"
        values1 = values1 $2 ","
        values2 = values2 $3 ","
      } else {
        props[length(props)] = "    Q_PROPERTY(QColor " $1 " READ " $1 " CONSTANT)" c
        getters[length(getters)] = "    QColor " $1 "() const { return colors[" length(getters) "]; }"
        values1 = values1 $2 ","
        values2 = values2 $2 ","
      }
    }
  } else {
    if (step == 0 && $0 == "    // color properties") {
      print $0
      for (i in props) {
        print props[i]
      }
      print ""
      while (getline > 0 && $0 != "") {}
      step = 1
    } else if (step == 1 && $0 == "    // getters") {
      print $0
      for (i in getters) {
        print getters[i]
      }
      print ""
      while (getline > 0 && $0 != "") {}
      step = 2
    } else if (step == 2 && $0 == "    QVector<QColor> allColors[2] = {{") {
      print $0
      print values1
      print "    }, {"
      print values2
      print "    }};"
      while (getline > 0 && $0 != "    }};") {}
      step = 3
    } else {
      print $0
    }
  }
}

END {
  if (step != 3)
    print "#error failed at step " step
}

