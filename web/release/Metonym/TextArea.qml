import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls


QtControls.TextArea {
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

    color: root.theme.col0

    leftInset: 0
    rightInset: 0
    topInset: 0
    bottomInset: 0

    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 0

    textMargin: 0

    font.italic: text.length <= 0

    Component.onCompleted: {
        // Do not set as a binding to avoid binding loop
        root.font.family = hiddenProps.fontSource.fontLoader.name
        root.font.bold = hiddenProps.fontSource.requiresBold
    }
}


