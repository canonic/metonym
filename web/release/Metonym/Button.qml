import QtQuick 2.15
import QtGraphicalEffects 1.15


FocusScope{
    id: root

    /*
    enum size {
        Minimal
    }

    property int size: Button.size.Minimal
    */

    property string label: ''
    property string icon: ''

    property bool bordered: false
    property bool borderIcon: false
    property int radius: 2

    property bool isPrimaryBtn: false
    property bool showBackground: bordered? true: false
    signal clicked(QtObject mouse)
    readonly property bool hovered: __mouseArea.containsMouse

    // font properties
    property int capitalization: Font.MixedCase
    property int pointSize: 10
    property font fontFamily: Styles.monterratBold.name
    property bool bold: true
    property bool underline: false
    property int horizontalAlignment: Text.AlignHCenter

    // Unfocused
    property color defaultColor: isPrimaryBtn? Styles.buttonColorFocusedDefault : Styles.buttonColorDefault
    property color hoverColor: isPrimaryBtn? Styles.buttonColorFocusedHover : Styles.buttonColorHover
    property color mouseDownColor: isPrimaryBtn? Styles.buttonColorFocusedDown : Styles.buttonColorDown

    // Focused
    property color defaultFocusedColor: Styles.buttonColorFocusedDefault
    property color hoverFocusedColor: Styles.buttonColorFocusedHover
    property color mouseDownFocusedColor: Styles.buttonColorFocusedDown

    opacity: enabled? 1: 0.6
    implicitWidth: Math.max(24, __content.contentWidth)
    implicitHeight: Math.max(24, __content.contentHeight)

    Item {
        id: __hiddenProperties

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
                    return Styles.buttonBorderMouseDownColor
                }
                else if(__mouseArea.containsMouse)
                {
                    return Styles.buttonBorderHoveredColor
                }
                else
                {
                    return Styles.buttonBorderDefaultColor
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
            if(__mouseArea.containsPress)
            {
                return Styles.buttonBackgroundPressed
            }

            if(__mouseArea.containsMouse)
            {
                return Styles.buttonBackgroundHovered
            }

            return Styles.buttonBackgroundDefault
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

        Glow {
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

            samples: 16
            spread: 0.3
            source: buttonBorder
            visible: true
        }

        Rectangle {
            id: buttonBorder
            radius: root.radius
            color: Styles.backgroundColor3
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
                return root.showBackground? 3: 0
            }
        }

        property real spacing: (root.label.length && root.icon.length) ? 5 : 0
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
            color: 'blue'
            anchors {
                left: __rightPadding.left
                right: __rightPadding.right
                top: parent.top
                bottom: parent.bottom
            }
        }
        */


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
                left: __leftPadding.left
            }
        }

        Text{
            id: __buttonLabel
            text: root.label
            color: __hiddenProperties.color
            elide: Text.ElideRight

            visible: root.label.length

            font{
                family: root.fontFamily
                bold: root.bold
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

        Item{
            id: __iconCointainer

            width: root.icon.length? 24 : 0
            height: root.icon.length? 24 : 0

            anchors {
                right: __rightStretch.left
                verticalCenter: parent.verticalCenter
            }

            visible: root.icon.length

            Rectangle{
                id: __iconImagePlusBorder
                anchors{
                    fill: parent
                    margins: 2
                }
                color: 'transparent'

                radius: root.radius
                border {
                    width: root.borderIcon? 1 : 0
                }

                layer {
                    enabled: true
                    samples: 32
                }

                Icon {
                    id: __iconImage
                    anchors{
                        fill: parent
                        margins: 2
                    }

                    source: root.icon
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                visible: false
            }

            OpacityMask {
                id: __opacityMask
                anchors.fill: parent
                source: __fillColor
                maskSource: __iconImagePlusBorder
                visible: true
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

    /*
    Row {
        id: row
        spacing: 5

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
                return root.showBackground? 3: 0
            }
        }

        topPadding: row.verticalPadding
        bottomPadding: row.verticalPadding
        leftPadding: row.horizontalPadding
        rightPadding:  row.horizontalPadding

        anchors {
            centerIn: parent
        }

        Text{
            id: __buttonLabel
            text: root.label
            color: __hiddenProperties.color
            elide: Text.ElideRight

            font{
                family: root.fontFamily
                bold: root.bold
                capitalization: root.capitalization
                pointSize: root.pointSize
                underline: root.isPrimaryBtn && !root.showBackground && root.activeFocus
            }

            anchors.verticalCenter: parent.verticalCenter
        }

        Item{
            id: __iconCointainer

            width: 24
            height: 24
            visible: root.icon.length

            Rectangle{
                id: __iconImagePlusBorder
                anchors{
                    fill: parent
                    margins: 2
                }
                color: 'transparent'

                radius: root.radius
                border {
                    width: root.borderIcon? 1 : 0
                }

                layer{
                    enabled: true
                    samples: 32
                }

                Icon{
                    id: __iconImage
                    anchors{
                        fill: parent
                        margins: 2
                    }

                    source: root.icon
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                visible: false
            }

            OpacityMask {
                id: __opacityMask
                anchors.fill: parent
                source: __fillColor
                maskSource: __iconImagePlusBorder
                visible: true
            }

        }
    }
    */

    MouseArea{
        id: __mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onPressed: root.forceActiveFocus()

        onClicked: {
            root.forceActiveFocus()
            root.clicked(mouse)
        }
    }

    /*
    Rectangle {
        anchors.fill: row
        color: 'transparent'
        border {
            width: 1
            color: 'cyan'
        }
    }
    */



}
