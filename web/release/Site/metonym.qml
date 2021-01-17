import QtQuick 2.15
import '../Metonym' as Metonym

Metonym.ThemedItem {
    id: root

    property var components: [
        {
            'id': 'Button',
            'source' : 'ButtonPage.qml'
        },
        {
            'id': 'CheckBox',
            'source' : 'CheckBoxPage.qml'
        },
        {
            'id': 'ComboBox',
            'source' : 'ComboBoxPage.qml'
        },
        {
            'id': 'LineEdit',
            'source' : 'LineEditPage.qml'
        },
        {
            'id': 'Colours',
            'source' : 'ColourListPage.qml'
        }
    ]

    Component {
        id: buttonView

        Rectangle {
            color: 'green'
        }
    }

    Component {
        id: lineEditView

        Rectangle {
            color: 'purple'
        }
    }

    Rectangle {
        id: header

        width: parent.width
        height: 80

        color: 'red'

        Text {
            text: 'home'
            color: 'white'
            TapHandler {
                onTapped: root.component = null
            }
        }

    }

    Rectangle {
        id: componentsList

        color: 'white'

        width: 300

        anchors {
            top: header.bottom
            bottom: parent.bottom
        }

        Repeater {
            model: root.components.length

            delegate: Rectangle {
                Text {
                    text: root.components[index].id
                    y: index * 40
                    TapHandler {
                        onTapped: componentContainer.source = root.components[index].source
                    }
                }
            }
        }

    }

    Loader {
        id: componentContainer

        anchors {
            top: header.bottom
            bottom: parent.bottom
            left: componentsList.right
            right: parent.right
        }
    }
}
