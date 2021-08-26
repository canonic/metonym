import QtQuick 2.15
import Qt5Compat.GraphicalEffects as QtGraphicalEffects

Item {
    id: root
    property color color: 'black'

    property string source: ''
    property alias horizontalAlignment: __icon.horizontalAlignment
    property alias verticalAlignment: __icon.verticalAlignment

    readonly property bool isVector: root.source.toString().toLowerCase().endsWith('.svg')

    readonly property bool isFont: root.source.startsWith("font:")
    readonly property bool isRaster: !isVector && !isFont

    readonly property string fontIconCharacter: {
        if(!root.isFont)
        {
            return ""
        }

        // Remove prefix
        var fontData = root.source.substring("font:".length)
        fontData = fontData.split(',')

        if(fontData.length < 1){
            return ""
        }

        return fontData[0]
    }

    readonly property string fontSource: {
        if(!root.isFont)
        {
            return ""
        }

        // Remove prefix
        var fontData = root.source.substring("font:".length)
        fontData = fontData.split(',')

        if(fontData.length < 2){
            return ""
        }

        return fontData[1]
    }

    FontLoader {
        id: _fontLoader
        source: root.fontSource
    }

    Image {
        id: __icon

        anchors.fill: parent

        fillMode: Image.PreserveAspectFit
        mipmap: true
        smooth: true
        antialiasing: true

        source: root.isFont? "" : root.source

        sourceSize{
            width: root.isSvg? root.width: undefined
            height: root.isSvg? root.height: undefined
        }

        Text {
            anchors.centerIn: parent

            width: parent.width
            height: parent.height

            font.pointSize: 100
            minimumPointSize: 10
            fontSizeMode: Text.Fit

            font{
                family: _fontLoader.name
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter


            text: {
                if(root.isFont)
                {
                    if(_fontLoader.status === FontLoader.Ready)
                    {
                        return root.fontIconCharacter
                    }
                }
                return ''
            }
        }

        visible: !root.isFont && Qt.colorEqual(root.color, 'transparent')
    }

    Rectangle {
        id: __fill
        anchors.fill: __icon
        color: root.color
        visible: false
    }

    QtGraphicalEffects.OpacityMask {
        id: addressBarIconOpactiyMask

        anchors.fill: __icon
        source: __fill
        maskSource: __icon

        visible: !(!root.isFont && Qt.colorEqual(root.color, 'transparent'))
    }
}

