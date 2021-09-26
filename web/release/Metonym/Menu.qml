import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
import QtQuick.Controls.Material.impl as MaterialImpl
import QtQuick.Window

QtControls.Menu {
    id: root

    property alias theme: _themedItem.theme
    property FontGroup fontGroup: root.theme.menu.fontGroup

    ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }

    property string iconSource: ''

    // Set to false to use the icons color instead of filling the icon
    property bool fillIcon: true

    property bool showIndicator: true

    property double radius: theme.popup.radius
    property color backgroundColor: theme.popup.backgroundColor
    property double elevation: theme.popup.elevation
    property color shadowColor: theme.popup.shadowColor
    property color dimColor: theme.popup.dimColor


    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 0
    verticalPadding: 8

    transformOrigin: !cascade ? Item.Top : (mirrored ? Item.TopRight : Item.TopLeft)

    font {
        family: root.fontGroup.getFontSource(Font.QtWeight.Regular, false).fontLoader.name
        pointSize: 8
    }

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

    contentItem: ListView {
        implicitHeight: contentHeight

        model: root.contentModel
        interactive: Window.window
                        ? contentHeight + root.topPadding + root.bottomPadding > Window.window.height
                        : false
        clip: true
        currentIndex: root.currentIndex

        QtControls.ScrollIndicator.vertical: QtControls.ScrollIndicator {}
    }

    delegate: QtControls.MenuItem {
        id: menuItem
        implicitHeight: Styles.menuItemHeight

        arrow: Canvas {
            id: arrowCanvas
            x: parent.width - width
            implicitWidth: 40
            implicitHeight: 40
            visible: menuItem.subMenu
            anchors {
                verticalCenter: parent.verticalCenter
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = menuItem.highlighted ? root.theme.col0 : root.theme.col19
                ctx.moveTo(15, 15)
                ctx.lineTo(width - 15, height / 2)
                ctx.lineTo(15, height - 15)
                ctx.closePath()
                ctx.fill()
            }
        }

        // The checkable indicator
        indicator: Item {
            property real leftBarPadding: Styles.menuItemLeftBarWidth

            implicitWidth: Styles.menuItemHeight + leftBarPadding
            implicitHeight: Styles.menuItemHeight

            x: leftBarPadding

            Rectangle {
                width: 20
                height: 20
                anchors.centerIn: parent
                visible: menuItem.checkable
                border.color: "red"
                radius: 3
                Rectangle {
                    width: 14
                    height: 14
                    anchors.centerIn: parent
                    visible: menuItem.checked
                    color: "yellow"
                    radius: 2
                }
            }

            Icon {
                width: 20
                height: 20
                anchors.centerIn: parent
                visible: menuItem.icon
                horizontalAlignment : Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: menuItem.icon.source
            }
        }

        contentItem: Text {
            id: textItem
            leftPadding: menuItem.indicator.width
            rightPadding: menuItem.arrow.width
            text: menuItem.text
            font: menuItem.font
            opacity: enabled ? 1.0 : 0.3
            color: menuItem.highlighted ? root.theme.col0 : root.theme.col19
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            layer.enabled: true
        }

        background: Rectangle {
            width: parent.width
            implicitHeight: Styles.menuItemHeight

            layer.enabled: true
            color: root.theme.col0

            Rectangle {
                anchors.fill: parent
                opacity: menuItem.pressed? 0.4 : 0.15

                Behavior on opacity {
                    NumberAnimation {
                        duration: 140
                        easing.type: Easing.InOutSine
                    }
                }

                color: menuItem.highlighted ? root.theme.brand : "transparent"
            }

            Rectangle {
                width: Styles.menuItemLeftBarWidth
                height: parent.height
                color: root.theme.brand
                visible: menuItem.highlighted
            }
        }
    }

    background: Rectangle {
        implicitWidth: {
            let maxWidth = 0
            for(var i = 0; i < root.count ; i++)
            {
                const menuItem = root.itemAt(i)
                if(menuItem.implicitWidth > maxWidth)
                {
                    maxWidth = menuItem.implicitWidth
                }
            }
            return maxWidth
        }
        implicitHeight: Styles.menuItemHeight
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
