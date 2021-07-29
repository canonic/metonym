import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.TextField {
    id: root

    property alias theme: __internalThemedItem.theme
    property FontGroup fontGroup: root.theme.textField.fontGroup

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    QtObject {
        id: hiddenProps
        readonly property FontSource fontSource: root.fontGroup.getFontSource(root.font.weight,
                                                                              root.font.italic)
    }

    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 2

    font {
        pointSize: 10
    }

    color: root.theme.col0

    background: Item {
        Rectangle{
            id: borderBottom
            width: parent.width
            height: 1
            color: Styles.borderColor
            anchors.top: parent.bottom
        }
    }

    Component.onCompleted: {
        // Do not set as a binding to avoid binding loop
        root.font.family = hiddenProps.fontSource.fontLoader.name
        root.font.bold = hiddenProps.fontSource.requiresBold

        const requiresItalic = hiddenProps.fontSource.requiresItalic
        root.font.italic = Qt.binding(function() {return requiresItalic || root.text.length <= 0})
    }
}
