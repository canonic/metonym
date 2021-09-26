import QtQuick 2.15
import Qt5Compat.GraphicalEffects as QtGraphicalEffects


FocusScope{
    id: root

    property alias theme: __internalThemedItem.theme

    ThemedItem {
        id: __internalThemedItem
        inheritanceParent: root.parent
    }

    /*
    enum size {
        Minimal
    }

    property int size: Button.size.Minimal
    */

    property string label: ''
    property Icon icon: Icon {
        color: isRaster? 'transparent' : __hiddenProperties.color
    }
    property bool circularButtonIcon: false

    property bool bordered: false
    property bool borderIcon: false
    property int radius: 2

    property bool isPrimaryBtn: false
    property bool showBackground: bordered? true: false
    signal clicked(QtObject mouse)
    signal pressAndHold(QtObject mouse)
    readonly property bool hovered: __mouseArea.containsMouse

    // font properties
    property int capitalization: Font.MixedCase
    property int pointSize: 10
    property bool bold: true
    property bool underline: false
    property int horizontalAlignment: Text.AlignHCenter

    // Unfocused
    property color defaultColor: isPrimaryBtn? root.theme.button.defaultFocusedColor : root.theme.button.defaultColor
    property color hoverColor: isPrimaryBtn? root.theme.button.hoverFocusedColor : root.theme.button.hoverColor
    property color mouseDownColor: isPrimaryBtn? root.theme.button.pressedFocusedColor : root.theme.button.pressedFocusedColor

    // Focused
    property color defaultFocusedColor: root.theme.button.defaultFocusedColor
    property color hoverFocusedColor: root.theme.button.hoverFocusedColor
    property color mouseDownFocusedColor: root.theme.button.pressedFocusedColor

    property color backgroundColor: root.theme.button.backgroundColor
    property color backgroundHoveredColor: root.theme.button.backgroundHoveredColor
    property color backgroundPressedColor: root.theme.button.backgroundPressedColor

    opacity: enabled? 1: 0.6
    implicitWidth: Math.max(24, __content.contentWidth)
    implicitHeight: Math.max(24, __content.contentHeight)

    Item {
        id: __hiddenProperties

        readonly property FontSource fontSource: root.theme.font1.getFontSource(Font.Weight.SemiBold, false)

        property color color: {

            if(root.activeFocus)
            {
                if(__mouseArea.containsPress)
                {
                    return root.mouseDownFocusedColor
                }

                if(__mouseArea.containsMouse)
                {
                    return root.hoverFocusedColor
                }

                return root.defaultFocusedColor
            }
            else
            {
                if(__mouseArea.containsPress)
                {
                    return root.mouseDownColor
                }

                if(__mouseArea.containsMouse)
                {
                    return root.hoverColor
                }

                return root.defaultColor
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        property color borderColor: {
            if(root.containsFocus)
            {
                if(__mouseArea.containsPress)
                {
                    return root.theme.border.borderColorFocusedMouseDown
                }

                if(__mouseArea.containsMouse)
                {
                    return root.theme.border.borderColorFocusedHovered
                }

                return root.theme.border.borderColorFocused
            }
            else
            {
                if(__mouseArea.containsPress)
                {
                    return root.theme.border.borderColorMouseDown
                }
                else if(__mouseArea.containsMouse)
                {
                    return root.theme.border.borderColorHovered
                }
                else
                {
                    return root.theme.border.borderColor
                }
            }
        }

        Behavior on borderColor {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        property color backgroundColor:  {
            if (!root.enabled)
            {
                return root.backgroundColor
            }

            if(__mouseArea.containsPress)
            {
                return root.backgroundPressedColor
            }

            if(__mouseArea.containsMouse)
            {
                return root.backgroundHoveredColor
            }

            return root.backgroundColor
        }

        Behavior on backgroundColor {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }
    }

    Rectangle {
        id: __background
        anchors.fill: parent
        color: __hiddenProperties.backgroundColor
        radius: root.radius
        visible: root.showBackground && !root.bordered
    }

    Rectangle {
        id: __fillColor
        color: __hiddenProperties.color
        anchors.fill: parent
        visible: false
    }

    Item {
        id: buttonBorderContainer

        anchors.fill: parent

        QtGraphicalEffects.Glow {
            id: __buttonBorderGlow

            anchors.fill: buttonBorder

            radius: 4
            color: {
                if(root.containsFocus)
                {
                    return Styles.buttonBorderGlowColorFocusedDefault
                }
                else{
                    return Styles.buttonBorderGlowColorDefault
                }
            }

            opacity: __mouseArea.containsMouse? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 140
                    easing.type: Easing.InOutSine
                }
            }

            spread: 0.3
            source: buttonBorder
            visible: true
        }

        Rectangle {
            id: buttonBorder
            radius: root.radius
            color: root.showBackground? __hiddenProperties.backgroundColor: 'transparent'
            anchors.fill: parent

            // the ammount the border should overlap with the image
            property real overlap: 0

            width: parent.width + ((border.width - overlap) * 2)
            height: width

            border {
                color: __hiddenProperties.borderColor
                width: 1
            }
        }
        visible: root.bordered
    }

    Item {
        id: __content

        property int verticalPadding: {
            if(root.bordered)
            {
                return 2
            }
            else{
                return root.showBackground? 3: 0
            }
        }

        property int horizontalPadding: {
            if(root.bordered)
            {
                if(root.label.length)
                {
                    return 10
                }
                else{
                    return 2
                }
            }
            else{
                return root.showBackground && !circularButtonIcon? 3: 0
            }
        }

        property real spacing: (root.label.length && root.icon.source.length) ? 5 : 0
        property real contentHeight: Math.max(__buttonLabel.height, __iconCointainer.height) + (verticalPadding*2)
        property real contentWidth: __buttonLabelNoElide.contentWidth + __iconCointainer.width + spacing + (horizontalPadding*2)
        property real stretch: {
            if (contentWidth < root.width)
            {
                return (root.width - contentWidth) / 2
            }
            return 0
        }

        anchors {
            fill: parent
        }

        /*
        Rectangle {
            color: 'cyan'
            anchors {
                left: __leftPadding.left
                right: __leftPadding.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'pink'
            anchors {
                left: __leftStretch.left
                right: __leftStretch.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'yellow'
            anchors {
                left: __buttonLabel.left
                right: __buttonLabel.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'red'
            anchors {
                left: __spacer.left
                right: __spacer.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'green'
            anchors {
                left: __iconCointainer.left
                right: __iconCointainer.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'purple'
            anchors {
                left: __rightStretch.left
                right: __rightStretch.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle {
            color: 'blue'
            anchors {
                left: __rightPadding.left
                right: __rightPadding.right
                top: parent.top
                bottom: parent.bottom
            }
        }*/


        Item {
            id: __leftPadding
            width: parent.horizontalPadding
            anchors {
                left: parent.left
            }
        }

        Item {
            id: __leftStretch
            width: {
                var alignment = root.horizontalAlignment
                var stretch = __content.stretch
                if(alignment === Text.AlignHCenter)
                {
                    return stretch
                }
                else if(alignment === Text.AlignLeft) {
                    return 0
                }
                else {
                    return stretch * 2
                }
            }
            anchors {
                left: __leftPadding.right
            }
        }

        Text{
            id: __buttonLabel
            text: root.label
            color: __hiddenProperties.color
            elide: Text.ElideRight

            visible: root.label.length

            horizontalAlignment: Text.AlignHCenter

            font{
                bold: root.bold
                family: __hiddenProperties.fontSource.fontLoader.name
                capitalization: root.capitalization
                pointSize: root.pointSize
                underline: {
                    if(root.underline)
                    {
                        return true
                    }

                    return root.isPrimaryBtn && !root.showBackground && root.activeFocus
                }
            }

            anchors {
                left: __leftStretch.right
                right: __spacer.left
                verticalCenter: parent.verticalCenter
            }
        }

        Text {
            // Text.contentWidth does not work if elide is set. This item is used to get the
            // actual contentWidth
            id: __buttonLabelNoElide
            text: __buttonLabel.text
            color: __buttonLabel.color
            font: __buttonLabel.font
            visible: false
        }

        Item {
            id: __spacer
            width: parent.spacing
            anchors {
                right: __iconCointainer.left
            }
        }

        Item {
            id: __iconCointainer

            width: root.icon.source.length? 28 : 0
            height: root.icon.source.length? 28 : 0

            anchors {
                right: __rightStretch.left
                verticalCenter: parent.verticalCenter
            }

            visible: root.icon.source.length

            Rectangle {
                id: __iconImagePlusBorder
                anchors{
                    fill: parent
                    margins: root.circularButtonIcon? 0 : 2

                    Behavior on margins {
                        NumberAnimation {
                            duration: 140
                            easing.type: Easing.InOutSine
                        }
                    }
                }
                color: 'transparent'

                radius: root.radius
                border {
                    color:  __iconImagePlusBorder.visible? __hiddenProperties.color : 'transparent'
                    width: root.borderIcon? 1 : 0
                }

                Icon {
                    id: __iconImage
                    anchors{
                        fill: parent
                        margins: root.circularButtonIcon? 0 : 2

                        Behavior on margins {
                            NumberAnimation {
                                duration: 140
                                easing.type: Easing.InOutSine
                            }
                        }
                    }

                    color: root.icon.color
                    source: root.icon.source
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    layer.enabled: root.circularButtonIcon
                    layer.effect: QtGraphicalEffects.OpacityMask {
                        maskSource: Item {
                            width: root.width
                            height: root.height
                            Rectangle {
                                anchors.centerIn: parent
                                width: root.circularButtonIcon && root.borderIcon? root.width - 8: root.width
                                height: width

                                Behavior on width {
                                    NumberAnimation {
                                        duration: 140
                                        easing.type: Easing.InOutSine
                                    }
                                }

                                radius: Math.max(width, height)
                            }
                        }
                    }
                }
            }
        }

        Item {
            id: __rightStretch
            width: {
                var alignment = root.horizontalAlignment
                var stretch = __content.stretch
                if(alignment === Text.AlignHCenter)
                {
                    return stretch
                }
                else if(alignment === Text.AlignLeft) {
                    return stretch * 2
                }
                else {
                    return 0
                }
            }
            anchors {
                right: __rightPadding.left
            }
        }

        Item {
            id: __rightPadding
            width: parent.horizontalPadding
            anchors {
                right: parent.right
            }
        }
    }

    MouseArea{
        id: __mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onPressed: root.forceActiveFocus()

        onClicked: (mouse) => {
            root.forceActiveFocus()
            root.clicked(mouse)
        }

        onPressAndHold: (mouse) => {
            root.pressAndHold(mouse)
        }
    }
}
