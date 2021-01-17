import QtQuick 2.15
import QtQuick.Controls 2.12 as QtControls
import QtGraphicalEffects 1.15

QtControls.MenuBarItem {
    id: menuBarItem

    property real radius: 0

    verticalPadding: 2
    horizontalPadding: 6
    implicitWidth: contentItem.implicitWidth + (horizontalPadding * 2)
    implicitHeight: 20 + (verticalPadding * 2)

    property color backgroundColorDefault: Styles.menuBarItemBackgroundColorDefault

    Item {
        id: __hiddenProperties

        property color color: {

            if(menuBarItem.menu.opened)
            {
                if(menuBarItem.pressed)
                {
                    return Styles.menuBarItemColorOpenedPressed
                }

                if(menuBarItem.highlighted)
                {
                    return Styles.menuBarItemColorOpenedHighlighted
                }

                return Styles.menuBarItemColorOpenedDefault
            }
            else
            {
                if(menuBarItem.pressed)
                {
                    return Styles.menuBarItemColorPressed
                }

                if(menuBarItem.highlighted)
                {
                    return Styles.menuBarItemColorHighlighted
                }

                return Styles.menuBarItemColorDefault
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        property color backgroundColor:  {

            if(menuBarItem.menu.opened)
            {
                if(menuBarItem.pressed)
                {
                    return Styles.menuBarItemBackgroundColorOpenedPressed
                }

                if(menuBarItem.hovered)
                {
                    return Styles.menuBarItemBackgroundColorOpenedHovered
                }

                return Styles.menuBarItemBackgroundColorOpenedDefault
            }

            if(menuBarItem.pressed)
            {
                return Styles.menuBarItemBackgroundColorPressed
            }

            if(menuBarItem.highlighted)
            {
                return Styles.menuBarItemBackgroundColorHighlighted
            }

            return menuBarItem.backgroundColorDefault
        }

        Behavior on backgroundColor {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }
    }

    contentItem: Item {
        id: row

        function calculateWidth() {
            var _iconContainerWidth = 0
            var _textContainerWidth = 0
            var _indicatorContainerWidth = 0
            var _spacing = -5

            if(__iconContainer.visible){
                _iconContainerWidth = __iconContainer.width
                _spacing += 5
            }

            if(__textContainer.visible){
                _textContainerWidth = __textContainer.width
                _spacing += 5
            }

            if(__menuBarIndicator.visible){
                _indicatorContainerWidth = __menuBarIndicator.width
                _spacing += 5
            }

            return _iconContainerWidth + _textContainerWidth + _indicatorContainerWidth + _spacing
        }

        implicitWidth: calculateWidth()
        width: implicitWidth

        // This shouldn't be required and yet it's needed...
        onWidthChanged: {

            if(width !== implicitWidth)
            {
                width = Qt.binding(function() { return implicitWidth })
            }
        }

        implicitHeight: 8

        anchors {
            horizontalCenter: menuBarItem.horizontalCenter
            verticalCenter: menuBarItem.verticalCenter
        }

        Item {
            id: __iconContainer
            width: __iconContainer.visible? __iconImage.width : 0
            height: __textContainer.height // We don't want the row stretching vertically due to the size of the icon

            anchors {
                verticalCenter: parent.verticalCenter
            }

            Rectangle {
                id: __fillColor
                color: __hiddenProperties.color
                anchors.fill: __iconImage
                visible: false
            }

            Image{
                id: __iconImage
                width: 20
                height: 20
                mipmap: true
                smooth: true

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                source: menuBarItem.menu.iconSource
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: !menuBarItem.menu.fillIcon
            }

            OpacityMask {
                id: __iconImageOpacityMask
                source: __fillColor
                maskSource: __iconImage

                width: __iconImage.width
                height: __iconImage.height

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                visible: menuBarItem.menu.fillIcon
            }

            visible: Boolean(menuBarItem.menu.iconSource)
        }

        Item {
            id: __textContainer
            height: 8
            width: menuBarItemText.contentWidth

            anchors {
                left:  __iconContainer.right
                verticalCenter: parent.verticalCenter
                leftMargin: __iconContainer.visible? 5 : 0
                rightMargin: __menuBarIndicator.visible? 5: 0
            }

            Text {
                id: menuBarItemText

                text: menuBarItem.text
                color: __hiddenProperties.color
                elide: Text.ElideRight

                font {
                    family: Styles.monterratRegular.name
                    pointSize: 8
                }

                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }

            visible: Boolean(menuBarItem.text.length)
        }


        Item {
            id: __menuBarIndicator

            width: 10
            height: 2

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Rectangle {
                id: __fillColor2
                color: __hiddenProperties.color
                anchors.fill: __iconImagePlusBorder2
                visible: false
            }

            Rectangle {
                id: __iconImagePlusBorder2

                width: 10
                height: 16

                color: 'transparent'

                radius: menuBarItem.radius

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                layer{
                    enabled: true
                    samples: 32
                }

                Image {
                    id: __iconImage2

                    anchors{
                        fill: parent
                    }

                    mipmap: true
                    smooth: true

                    source: menuBarItem.menu.opened? 'qrc:/assets/icons/angle-up.svg' : 'qrc:/assets/icons/angle-down.svg'
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                visible: false
            }

            OpacityMask {
                id: __opacityMask2

                width: __iconImagePlusBorder2.width
                height: __iconImagePlusBorder2.height

                anchors {
                    verticalCenter: parent.verticalCenter
                }
                source: __fillColor2
                maskSource: __iconImagePlusBorder2
            }

            visible: Boolean(menuBarItem.menu) && menuBarItem.menu.count && menuBarItem.menu.showIndicator
        }
    }

    background: Item {
        id: __menuBarItemBackground
        width: parent.width
        height: parent.height

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Rectangle {
            anchors.fill: parent
            radius: menuBarItem.radius
            color: __hiddenProperties.backgroundColor
        }

        // The bottom corners only have a radius if not open
        Rectangle {
            y: menuBarItem.radius
            height: parent.height - menuBarItem.radius
            width: parent.width
            visible: menuBarItem.menu.opened
            color: __hiddenProperties.backgroundColor
        }
    }
}
