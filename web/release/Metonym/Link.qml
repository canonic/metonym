import QtQuick 2.15

Button {
    id: root

    property url url: ''

    defaultColor: root.theme.link.defaultColor
    hoverColor: root.theme.link.hoverColor
    mouseDownColor: root.theme.link.pressedColor

    defaultFocusedColor: root.theme.link.defaultFocusedColor
    hoverFocusedColor: root.theme.link.hoverFocusedColor
    mouseDownFocusedColor: root.theme.link.pressedFocusedColor

    label: url
    underline: hovered || activeFocus
    horizontalAlignment: Text.AlignLeft
    onClicked: {
        if(url)
        {
            window.location.href = url
        }
    }
}
