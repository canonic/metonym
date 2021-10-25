import QtQuick 2.15

Text {
    id: root

    property alias theme: _themedItem.theme
    property FontGroup fontGroup: root.theme.label.fontGroup

    ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }

    QtObject {
        id: hiddenProps
        readonly property FontSource fontSource: root.fontGroup.getFontSource(root.font.weight,
                                                                              root.font.italic)   
    }

    font {
        pointSize: 10
    }

    property color disabledColor: root.theme.label.disabledColor
    property color defaultColor: root.theme.col0
    color: root.enabled? defaultColor : root.disabledColor

    Component.onCompleted: {
        root.font.family = Qt.binding(() => {return hiddenProps.fontSource.fontLoader.name})
        root.font.bold = Qt.binding(() => {return hiddenProps.fontSource.requiresBold})
    }
}


