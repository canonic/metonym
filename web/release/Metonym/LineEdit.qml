import QtQuick 2.15
import QtGraphicalEffects 1.12

FocusScope {
    id: root
    //property alias title: title.text
    property alias text: input.text
    property alias font: input.font
    property real minWidth: 50

    implicitHeight: inputBackground.height
    implicitWidth: 300

    property bool centerInput: false
    property bool inputGrowth: false // Should the input field grow with the text

    property string placeholder: ''

    readonly property bool showEllipsis: {

        const cursorPos = input.cursorPosition

        if(input.contentWidth > input.width)
        {
            const lastVisibleChar = input.positionAt(input.width, 0, TextInput.CursorBetweenCharacters)

            // If the last visible character in the text input box is the last character
            // in the text then don't show the ellipsis
            if(lastVisibleChar < input.text.length)
            {
                return true
            }
        }

        return false
    }

    Item {
        id: inputBackground
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: root.centerInput? parent.horizontalCenter: undefined
        }

        width: {
            let _width= 0

            if(root.inputGrowth)
            {
                if(root.text.length)
                {
                    _width = input.contentWidth + 10
                }
                else{
                    _width = placeholder.contentWidth + 10
                }
            }
            else{
                _width = root.width
            }

            if(_width < root.minWidth)
            {
                _width = root.minWidth
            }

            if(_width > parent.width)
            {
                _width = parent.width
            }

            return _width
        }

        //width: Math.max(root.minWidth, root.width)
        height: input.height + 10

        FontMetrics {
            id: fontMetrics
            font.family: input.font.family
        }

        Rectangle {
            id: inputMask

            anchors{
                verticalCenter: parent.verticalCenter
            }

            height: input.height
            width: {

                if(!root.showEllipsis)
                {
                    return input.width
                }

                // No ellipsis will ever show if there are less than 4 characters in the input
                if(input.text.length < 4)
                {
                    return 0
                }

                // required to update correctly
                const cursorPosition = input.cursorPosition

                // get the index of the last visible character
                const lastVisibleChar = input.positionAt(input.width, 0, TextInput.CursorBetweenCharacters)
                const posAtLastChar = input.positionToRectangle(lastVisibleChar)

                const firstVisibleChar = input.positionAt(0, 0, TextInput.CursorBetweenCharacters)
                const posAtFirstChar = input.positionToRectangle(firstVisibleChar)
                const visibleTextWidth = posAtLastChar.x - posAtFirstChar.x

                // get the index of the character three chars before this one
                var firstLastVisibleChar = lastVisibleChar - 3
                if(firstLastVisibleChar < 0)
                {
                    firstLastVisibleChar = 0
                }

                // mask the last three chars so that the ("...") has space to show
                var lastVisibleCharacters = input.text.substring(firstLastVisibleChar, lastVisibleChar)
                var maskedCharsWidth = fontMetrics.tightBoundingRect(lastVisibleCharacters).width + fontMetrics.leading

                return visibleTextWidth - maskedCharsWidth
            }
            color: 'transparent'
            clip: true

            TextInput {
                id: input
                color: 'white'
                focus: true
                width: inputBackground.width
                clip: true
                selectByMouse: true

                font {
                    pointSize: 12
                }

                horizontalAlignment: root.centerInput? Text.AlignHCenter: Text.AlignLeft
            }
        }

        Text {
            id: elideSuffix
            y: inputMask.y
            anchors{
                left: inputMask.right
                leftMargin: fontMetrics.leading
            }
            color: input.color
            text: "..."
            font: input.font
            width: visible? contentWidth: 0
            visible: root.showEllipsis
        }

        Text {
            id: placeholder

            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: root.centerInput? parent.horizontalCenter: undefined
            }

            visible: input.text.length === 0 && !input.activeFocus
            text: root.placeholder
            color: input.color
            opacity: input.opacity * 0.6
            elide: Text.ElideRight
            font{
                bold: input.font.bold
                capitalization: input.font.capitalization
                family: input.font.family
                hintingPreference: input.font.hintingPreference
                italic: true
                kerning: input.font.kerning
                letterSpacing: input.font.letterSpacing
                //pixelSize: input.font.pixelSize
                pointSize: input.font.pointSize
                preferShaping: input.font.preferShaping
                strikeout: input.font.strikeout
                styleName: input.font.styleName
                underline: input.font.underline
                weight: input.font.weight
                wordSpacing: input.font.wordSpacing
            }
        }

        Rectangle{
            id: borderBottom
            width: parent.width
            height: 1
            color: Styles.borderColor
            anchors.bottom: parent.bottom
        }
    }
}
