import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
import QtQuick.Controls.Material as Material
import QtQuick.Controls.Material.impl as MaterialImpl

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
    property color dimColor: theme.popup.dimColor

    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: 12

    enter: Transition {
        // grow_fade_in
        NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
        // shrink_fade_out
        NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    background: Rectangle {
        radius: 2
        color: root.backgroundColor

        layer.enabled: root.elevation > 0
        layer.effect: MaterialImpl.ElevationEffect {
            elevation: root.elevation
        }
    }

    QtControls.Overlay.modal: Rectangle {
        color: root.dimColor
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }

    QtControls.Overlay.modeless: Rectangle {
        color: root.dimColor
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }
}
