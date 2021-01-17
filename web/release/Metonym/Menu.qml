import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.Menu {
    id: root

    property string iconSource: ''

    // Set to false to use the icons color instead of filling the icon
    property bool fillIcon: true

    property bool showIndicator: true

    font {
        family: Styles.monterratRegular.name
        pointSize: 8
    }

    delegate: QtControls.MenuItem {
        id: menuItem
        implicitHeight: Styles.menuItemHeight

        arrow: Canvas {
            x: parent.width - width
            implicitWidth: 40
            implicitHeight: 40
            visible: menuItem.subMenu
            anchors {
                verticalCenter: parent.verticalCenter
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = menuItem.highlighted ? "#ffffff" : "#black"
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
            color: menuItem.highlighted ? "black" : "black"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            layer.enabled: true
        }

        background: Rectangle {
            width: parent.width
            implicitHeight: Styles.menuItemHeight

            layer.enabled: true
            color: 'white'

            Rectangle {
                anchors.fill: parent
                opacity: menuItem.pressed? 0.4 : 0.15

                Behavior on opacity {
                    NumberAnimation {
                        duration: 140
                        easing.type: Easing.InOutSine
                    }
                }

                color: menuItem.highlighted ? Styles.brandColor : "transparent"
            }

            Rectangle {
                width: Styles.menuItemLeftBarWidth
                height: parent.height
                color: Styles.brandColor
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
        color: 'white'
        layer.enabled: true
    }
}
