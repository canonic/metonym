import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls
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

    Metonym.Pane {
        id: componentsList

        elevation: 10

        width: 300

        anchors {
            top: header.bottom
            bottom: parent.bottom
        }

        Repeater {
            model: root.components.length

            delegate: Metonym.Button {
                label: root.components[index].id
                y: index * 40
                onClicked: componentContainer.source = root.components[index].source
            }
        }

    }

    QtControls.ScrollView {

        anchors {
            top: header.bottom
            bottom: parent.bottom
            left: componentsList.right
            right: parent.right
        }

        Loader {
            id: componentContainer
            width: parent.width
        }
    }
}
