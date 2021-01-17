import QtQuick 2.15
import QtQuick.Controls 2.12 as QtControls
import QtGraphicalEffects 1.15

QtControls.MenuBar {
    id: root
    property bool roundCorners: true

    delegate: MenuBarItem {
        radius: roundCorners? 2: 0
    }

    spacing: 5

    // No visible background for the Menu bar
    background: Item {}
}
