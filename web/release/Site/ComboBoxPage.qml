import QtQuick 2.15
import '../Metonym' as Metonym


Metonym.ThemedItem {
    id: root
    anchors.fill: parent

    Column {

        Text {
            text: 'ComboBox'
            font {
                family: root.theme.font1.medium.name
                pointSize: 20
            }

            color: 'white'
        }

        Text {
            text: 'fdfd'
            font {
                family: root.theme.font1.regular.name
                pointSize: 12
            }

            color: 'white'
        }

        Text {
            text: 'Examples'
            font {
                family: root.theme.font1.medium.name
                pointSize: 20
            }

            color: 'white'
        }

        Metonym.ComboBox {
            model: ListModel {
                id: model
                ListElement { text: "Banana" }
                ListElement { text: "Apple" }
                ListElement { text: "Pear" }
            }
        }

        Text {
            text: 'API'
            font {
                family: root.theme.font1.medium.name
                pointSize: 20
            }

            color: 'white'
        }
    }
}
