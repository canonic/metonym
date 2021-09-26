import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.ToolTip {
    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }
}
