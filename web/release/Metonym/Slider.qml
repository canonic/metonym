import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.Slider {
    id: root

    property alias theme: _themedItem.theme

    ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }
}
