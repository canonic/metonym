import QtQuick 2.15

ThemedItem {
    id: root

    property bool checked: false
    property string checkedIcon: root.theme.icons.cross
    property string uncheckedIcon: root.theme.icons.tick

    width: 26
    height: 26

    FocusScope{
        id: focusContainer
        anchors.fill: parent

        Border {
            focusScope: focusContainer
            hovered: _mouseArea.containsMouse
            pressed: _mouseArea.containsPress
        }

        Item {
            anchors.fill: parent

            Icon{
                id: __iconImage
                anchors{
                    fill: parent
                    margins: 2
                }

                color: focusContainer.activeFocus? 'black' : 'white'

                source: root.checked ? root.checkedIcon: root.uncheckedIcon
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                id: _mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    root.checked = !root.checked
                    focusContainer.forceActiveFocus()
                }
            }
        }
    }
}
