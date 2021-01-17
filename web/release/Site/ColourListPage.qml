import QtQuick 2.15
import '../Metonym' as Metonym

Metonym.ThemedItem {
    id: root
    anchors.fill: parent

    ListView {
        anchors.fill: parent

        model: root.theme.colours
        delegate: Rectangle {
            width: 40
            height: 40
            color: modelData

            Text {
                anchors {
                    left: parent.right
                    verticalCenter: parent.verticalCenter
                }

                color: root.theme.col0
                text: 'col' + index
            }
        }
    }

}
