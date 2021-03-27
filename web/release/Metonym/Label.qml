import QtQuick 2.0

Text {
    id: root

    property alias theme: _themedItem.theme

    ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }

    font {
        family: root.theme.font1.regular.name
        pointSize: 10
    }

    color: root.theme.col0
}


