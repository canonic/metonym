import QtQuick 2.15
import QtQuick.Controls 2.15 as QtControls

QtControls.SplitView {
    id: root

    property alias theme: _themedItem.theme

    property ThemedItem _themedItem: ThemedItem {
        id: _themedItem
        inheritanceParent: root.parent
    }

    handle: Rectangle {
        implicitWidth: 3
        implicitHeight: 3

        color: {
            if (QtControls.SplitHandle.pressed)
            {
                return root.theme.splitView.handlePressedColor
            }

            if(QtControls.SplitHandle.hovered)
            {
                return root.theme.splitView.handleHoveredColor
            }

            return root.theme.splitView.handleDefaultColor
        }

        Behavior on color {
            ColorAnimation {
                duration: 80
                easing.type: Easing.InOutSine
            }
        }
    }

    onResizingChanged: {
        // Set the relative ratios of each visible item in the items preferredHeight / preferredWidth
        const visibleChildren = root.contentItem.visibleChildren
        if(root.orientation === Qt.Horizontal)
        {
            for (var i = 0; i < visibleChildren.length; i++)
            {
                const child = visibleChildren[i]

                // Skip the fill width child (There can only be one)
                if(child.QtControls.SplitView.fillWidth)
                {
                    continue
                }

                const childWidthRatio = child.width / root.width
                child.QtControls.SplitView.preferredWidth = Qt.binding(() => { return root.width * childWidthRatio })
            }
        }
        else{
            for (var j = 0; j < visibleChildren.length; j++)
            {
                const child = visibleChildren[j]

                // Skip the fill width child (There can only be one)
                if(child.QtControls.SplitView.fillHeight)
                {
                    continue
                }

                const childHeightRatio = child.height / root.height
                child.QtControls.SplitView.preferredHeight = Qt.binding(() => { return root.height * childHeightRatio })
            }
        }
    }
}
