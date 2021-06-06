import QtQuick 2.15
import '../Metonym' as Metonym


Metonym.ThemedItem {
    id: root
    anchors.fill: parent

    Column {

        Text {
            text: 'Button'
            font {
                family: root.theme.font1.medium.name
                pointSize: 20
            }

            color: 'white'
        }

        Text {
            text: 'asdhgjgklsd'
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

        Metonym.Button {
            label: 'Example'
            bordered: true
        }

        Metonym.Button {
            label: 'Example'
            bordered: false
        }

        Metonym.Button {
            label: 'Example'
            icon.source: root.theme.icons.tick
            bordered: true
        }

        Metonym.Button {
            label: 'Example'
            icon.source: root.theme.icons.tick
            bordered: false
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            bordered: true
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            bordered: false
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            width: 36
            height: 36
            bordered: true
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            width: 36
            height: 36
            bordered: false
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            width: 36
            height: 36
            radius: width / 2
            bordered: true
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            width: 36
            height: 36
            radius: width / 2
            bordered: false
            showBackground: true
        }

        Metonym.Button {
            icon.source: root.theme.icons.tick
            width: 36
            height: 36
            radius: width / 2
            bordered: false
        }

        Metonym.Button {
            label: 'Example'
            icon.source: root.theme.icons.tick
            bordered: false
            borderIcon: true
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
