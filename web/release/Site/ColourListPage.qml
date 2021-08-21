import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
import '../Metonym' as Metonym

Metonym.ThemedItem {
    id: root

    implicitHeight: content.height

    Column {
        id: content

        width: parent.width

        spacing: 10

        Metonym.Slider {
            id: colValueSider
            width: parent.width
            value: 0
            from: 0
            to: 1
        }

        Rectangle {
            width: 100
            height: 100
            color: root.theme.colourMain(colValueSider.value)
        }

        Row {
            width: parent.width

            Repeater {
                id: colRepeater
                model: parent.width / 4

                Rectangle {
                    width: parent.width / colRepeater.model
                    height: 50
                    color: root.theme.colourMain(index / colRepeater.model)
                }
            }
        }

        Metonym.TextField {
            text: colValueSider.value
        }


        Repeater {
            id: colorListView

            height: 800

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
}
