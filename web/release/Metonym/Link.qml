import QtQuick 2.15

Button {
    property url url: ''

    underline: hovered
    horizontalAlignment: Text.AlignLeft
    onClicked: {
        if(url)
        {
            window.location.href = url
        }
    }
}
