import QtQuick 2.15
import QtQuick.Controls 2.12 as QtControls

QtControls.MenuBarItem {
    id: root

    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    property real radius: 0

    verticalPadding: 2
    horizontalPadding: 6
    implicitWidth: contentItem.implicitWidth + (horizontalPadding * 2)
    implicitHeight: 20 + (verticalPadding * 2)

    property color backgroundColourDefault: root.theme.menuBarItem.backgroundColourDefault
    property color backgroundColourHighlighted: root.theme.menuBarItem.backgroundColourHighlighted
    property color backgroundColourPressed: root.theme.menuBarItem.backgroundColourPressed

    property color backgroundColourOpenedDefault: root.theme.menuBarItem.backgroundColourOpenedDefault
    property color backgroundColourOpenedHighlighted: root.theme.menuBarItem.backgroundColourOpenedHighlighted
    property color backgroundColourOpenedPressed: root.theme.menuBarItem.backgroundColourOpenedPressed

    property color colourDefault: root.theme.menuBarItem.colourDefault
    property color colourHighlighted: root.theme.menuBarItem.colourHighlighted
    property color colourPressed: root.theme.menuBarItem.colourPressed

    property color colourOpenedDefault: root.theme.menuBarItem.colourOpenedDefault
    property color colourOpenedHighlighted: root.theme.menuBarItem.colourOpenedHighlighted
    property color colourOpenedPressed: root.theme.menuBarItem.colourOpenedPressed

    Item {
        id: __hiddenProperties

        property color color: {

            if(root.menu.opened)
            {
                if(root.pressed)
                {
                    return root.colourOpenedPressed
                }

                if(root.highlighted)
                {
                    return root.colourOpenedHighlighted
                }

                return root.colourOpenedDefault
            }
            else
            {
                if(root.pressed)
                {
                    return root.colourPressed
                }

                if(root.highlighted)
                {
                    return root.colourHighlighted
                }

                return root.colourDefault
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        property color backgroundColor:  {

            if(root.menu.opened)
            {
                if(root.pressed)
                {
                    return root.backgroundColourOpenedPressed
                }

                if(root.hovered)
                {
                    return root.backgroundColourOpenedHighlighted
                }

                return root.backgroundColourOpenedDefault
            }

            if(root.pressed)
            {
                return root.backgroundColourPressed
            }

            if(root.highlighted)
            {
                return root.backgroundColourHighlighted
            }

            return root.backgroundColourDefault
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
            var __iconWidth = 0
            var _textContainerWidth = 0
            var _indicatorContainerWidth = 0
            var _spacing = -5

            if(__icon.visible){
                __iconWidth = __icon.width
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

            return __iconWidth + _textContainerWidth + _indicatorContainerWidth + _spacing
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
            horizontalCenter: root.horizontalCenter
            verticalCenter: root.verticalCenter
        }

        Icon {
            id: __icon
            color: __hiddenProperties.color
            source: root.menu.iconSource
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            width:  visible? 20: 0
            height: visible? 20: __textContainer.height

            visible: Boolean(root.menu.iconSource)
        }

        Item {
            id: __textContainer
            height: 8
            width: menuBarItemText.contentWidth

            anchors {
                left:  __icon.right
                verticalCenter: parent.verticalCenter
                leftMargin: __icon.visible? 5 : 0
                rightMargin: __menuBarIndicator.visible? 5: 0
            }

            Text {
                id: menuBarItemText

                text: root.text
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

            visible: Boolean(root.text.length)
        }


        Item {
            id: __menuBarIndicator

            width: 10
            height: __iconImagePlusBorder2.height

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Icon {
                id: __iconImagePlusBorder2

                width: 10
                height: 16

                color: __hiddenProperties.color

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                source: root.menu.opened? root.theme.icons.angleUp : root.theme.icons.angleDown

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            visible: Boolean(root.menu) && root.menu.count && root.menu.showIndicator
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
            radius: root.radius
            color: __hiddenProperties.backgroundColor
        }

        // The bottom corners only have a radius if not open
        Rectangle {
            y: root.radius
            height: parent.height - root.radius
            width: parent.width
            visible: root.menu.opened
            color: __hiddenProperties.backgroundColor
        }
    }
}
