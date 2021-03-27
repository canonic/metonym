import QtQuick 2.0
import QtQuick.Controls 2.15 as QtControls

QtControls.ComboBox {
    id: root

    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }
}
