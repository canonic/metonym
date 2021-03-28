import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.Popup {
    id: root

    y: {
        if (parent && parent.height)
        {
            return parent.height + theme.popup.defaultYOffset
        }

        return theme.popup.defaultYOffset
    }

    property double radius: theme.popup.radius
    property color backgroundColor: theme.popup.backgroundColor
    property double elevation: theme.popup.elevation
    property color shadowColor: theme.popup.shadowColor

    property alias theme: __internalThemedItem.theme


    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    background: Pane  {
        radius: root.radius
        backgroundColor: root.backgroundColor
        elevation: root.elevation
        shadowColor: root.shadowColor
    }
}
