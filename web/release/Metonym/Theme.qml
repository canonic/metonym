import QtQuick 2.0

QtObject {
    required property FontGroup font1
    required property FontGroup font2
    required property FontGroup font3

    required property color col0
    required property color col1
    required property color col2
    required property color col3
    required property color col4
    required property color col5
    required property color col6
    required property color col7
    required property color col8
    required property color col9
    required property color col10
    required property color col11
    required property color col12
    required property color col13
    required property color col14
    required property color col15
    required property color col16
    required property color col17
    required property color col18
    required property color col19
    required property color col20
    required property color col21
    required property color col22

    readonly property var colours: [col0, col1, col2, col3, col4, col5, col6, col7, col8, col9,
        col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21]

    function getInterpolatedColour(pos)
    {
        if(pos < 0 || pos > colours.length)
        {
            throw "Invalid colour pos input"
        }

        var floor = Math.floor(pos)
        var ceil = Math.ceil(pos)

        var c1 = String(colours[floor])
        var c2 = String(colours[ceil])
        var amount = pos - floor

        return blendColors(c1, c2, amount)
    }

    /*
     * Blend two hex colors together by an amount
     * source - https://stackoverflow.com/a/56348573/14807704
     */
    function blendColors(colorA, colorB, amount) {
        const [rA, gA, bA] = colorA.match(/\w\w/g).map((c) => parseInt(c, 16));
        const [rB, gB, bB] = colorB.match(/\w\w/g).map((c) => parseInt(c, 16));
        const r = Math.round(rA + (rB - rA) * amount).toString(16).padStart(2, '0');
        const g = Math.round(gA + (gB - gA) * amount).toString(16).padStart(2, '0');
        const b = Math.round(bA + (bB - bA) * amount).toString(16).padStart(2, '0');
        return '#' + r + g + b;
    }

    function setColourAlpha(colour, alpha) {

        if (typeof colour === 'string' || colour instanceof String)
        {
            // Convert strings to color types
            colour = Qt.tint(colour, colour)
        }

        return Qt.hsla(colour.hslHue, colour.hslSaturation, colour.hslLightness, alpha)
    }

    required property BorderTheme border
    required property ButtonTheme button
    required property LabelTheme label
    required property LinkTheme link
    required property PaneTheme pane
    required property IconSet icons
    required property PopupTheme popup
}
