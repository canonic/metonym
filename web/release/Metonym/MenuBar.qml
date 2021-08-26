import QtQuick 2.15
import QtQuick.Controls 2.12 as QtControls

QtControls.MenuBar {
    id: root
    property bool roundCorners: true

    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    delegate: MenuBarItem {
        theme: root.theme
        radius: roundCorners? 2: 0
    }

    spacing: 5

    // No visible background for the Menu bar
    background: Item {}
}
