import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.BusyIndicator {
    id: root

    property color color: Styles.brandColorHover

    contentItem: Item {
        implicitWidth: 64
        implicitHeight: 64

        Item {
            id: item
            anchors.fill: parent
            opacity: root.running ? 1 : 0

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }

            RotationAnimator {
                target: item
                running: root.visible && root.running
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 1250
                easing.type: Easing.Linear
            }

            Icon {
                id: _icon
                anchors.fill: parent
                source: 'qrc:/assets/images/spinner-256px.png'
                color: root.color
            }
        }
    }
}
