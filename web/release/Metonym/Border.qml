import QtQuick 2.15
import QtGraphicalEffects 1.15

ThemedItem {
    id: root

    anchors.fill: parent

    // Optional parent focus scope
    property FocusScope focusScope: _unusedFocusScope


    property color color: root.theme.border.color
    property color colorFocused: root.theme.border.colorFocused
    property color colorFocusedHovered: root.theme.border.colorFocusedHovered
    property color colorFocusedMouseDown: root.theme.border.colorFocusedMouseDown

    property color glowColor: root.theme.border.glowColor

    property color borderColor: root.theme.border.borderColor
    property color borderColorHovered: root.theme.border.borderColorHovered
    property color borderColorMouseDown: root.theme.border.borderColorMouseDown
    property color borderColorFocused: root.theme.border.borderColorFocused
    property color borderColorFocusedHovered: root.theme.border.borderColorFocusedHovered
    property color borderColorFocusedMouseDown: root.theme.border.borderColorFocusedMouseDown

    property bool hovered: false
    property bool pressed: false


    // If no FocusScope is passed to the root then use this one
    FocusScope {
        id: _unusedFocusScope
    }


    Rectangle {
        color: 'red'
        anchors.fill: parent
    }



    Glow {
        id: __buttonBorderGlow

        anchors.fill: buttonBorder

        radius: 4
        color: root.glowColor

        opacity: root.hovered? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        samples: 16
        spread: 0.3
        source: buttonBorder
    }

    Rectangle {
        id: buttonBorder
        radius: 1
        color: {
            if(root.focusScope.activeFocus)
            {
                if(root.pressed)
                {
                    return root.colorFocusedMouseDown
                }

                if(root.hovered)
                {
                    return root.colorFocusedHovered
                }

                return root.colorFocused
            }
            else
            {
                return root.color
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 140
                easing.type: Easing.InOutSine
            }
        }

        anchors.fill: parent

        width: parent.width + (border.width * 2)
        height: width

        border {
            color: {
                if(root.focusScope.activeFocus)
                {
                    if(root.pressed)
                    {
                        return root.borderColorFocusedMouseDown
                    }

                    if(root.hovered)
                    {
                        return root.borderColorFocusedHovered
                    }

                    return root.borderColorFocused
                }
                else
                {
                    if(root.pressed)
                    {
                        return root.borderColorMouseDown
                    }

                    if(root.hovered)
                    {
                        return root.borderColorHovered
                    }

                    return root.borderColor
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: 140
                    easing.type: Easing.InOutSine
                }
            }

            width: 1
        }
    }
}
