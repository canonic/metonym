import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
import Qt5Compat.GraphicalEffects as QtGraphicalEffects

QtControls.Pane {
    id: root

    property double radius: theme.pane.radius
    property color backgroundColor: theme.pane.backgroundColor
    property double elevation: theme.pane.elevation
    property color shadowColor: theme.pane.shadowColor

    property alias theme: _themedItem.theme

    ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }

    background: Item {

        Item {
            id: _backgroundRect
            anchors.fill: parent
            // Corner rectangles
            Rectangle {
                x: 0
                y: 0
                width: root.radius * 2
                height: width
                radius: root.radius
                color: root.backgroundColor
            }

            Rectangle {
                x: root.width - width
                y: 0
                width: root.radius * 2
                height: width
                radius: root.radius
                color: root.backgroundColor
            }

            Rectangle {
                x: 0
                y: root.height - height
                width: root.radius * 2
                height: width
                radius: root.radius
                color: root.backgroundColor
            }

            Rectangle {
                x: root.width - width
                y: root.height - height
                width: root.radius * 2
                height: width
                radius: root.radius
                color: root.backgroundColor
            }

            // Fill Rectangles
            Rectangle {
                x: root.radius
                y: 0
                width: root.width - (root.radius * 2)
                height: root.height
                color: root.backgroundColor
            }

            Rectangle {
                x: 0
                y: root.radius
                width: root.width
                height: root.height - (root.radius * 2)
                color: root.backgroundColor
            }

            visible: root.elevation === 0
        }

        QtGraphicalEffects.DropShadow
        {
            anchors.fill: _backgroundRect
            source: _backgroundRect;

            horizontalOffset: 0;
            verticalOffset: root.elevation * 0.1;
            radius: root.elevation;
            color: root.shadowColor;

            visible: root.elevation !== 0
        }
    }
}


