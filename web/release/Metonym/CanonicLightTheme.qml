import QtQuick 2.15

Theme {

    // Constants
    readonly property string c_METONYM_ICONS_FONT_SOURCE: "./fonts/metonym-icons.ttf"

    readonly property CanonicDarkTheme _darkTheme: CanonicDarkTheme {}

    font1: FontGroup {
        sources: FontSources {
            thin: "./fonts/Montserrat-Thin.ttf"
            light: "./fonts/Montserrat-Light.ttf"
            regular: "./fonts/Montserrat-Regular.ttf"
            medium: "./fonts/Montserrat-Medium.ttf"
            semiBold: "./fonts/Montserrat-SemiBold.ttf"
            bold: "./fonts/Montserrat-Bold.ttf"
            extraBold: "./fonts/Montserrat-ExtraBold.ttf"
            black: "./fonts/Montserrat-Black.ttf"
            lightItalic: "./fonts/Montserrat-LightItalic.ttf"
        }
    }

    font2: FontGroup {
        sources: FontSources {
            light: "./fonts/Garnet-Capitals-Light.ttf"
            regular: "./fonts/Garnet-Capitals-Bold.ttf"
        }
    }

    col0: '#000000'
    col1: _darkTheme.col18
    col2: _darkTheme.col17
    col3: _darkTheme.col16
    col4: _darkTheme.col15
    col5: _darkTheme.col14
    col6: _darkTheme.col13
    col7: _darkTheme.col12
    col8: _darkTheme.col11
    col9: _darkTheme.col10
    col10: _darkTheme.col9
    col11: _darkTheme.col8
    col12:  _darkTheme.col7
    col13: _darkTheme.col6
    col14: _darkTheme.col5
    col15: _darkTheme.col4
    col16: _darkTheme.col3
    col17: _darkTheme.col2
    col18: _darkTheme.col1
    col19: '#FFFFFF'

    col20: '#1CFE98'
    col21: '#000000'
    col22: '#2F88F2'

    readonly property color brand: col20
    readonly property color brandHighlight: getInterpolatedColour(20.1)
    readonly property color brandDefault: getInterpolatedColour(20.1)
    readonly property color brandSelected: getInterpolatedColour(20.5)
    readonly property color brandPressed: getInterpolatedColour(20.2)

    border: BorderTheme {
        color: col17
        colorFocused: brandDefault
        colorFocusedHovered: brandHighlight
        colorFocusedMouseDown: brandPressed

        glowColor: col0

        borderColor: col14
        borderColorHovered: col12
        borderColorMouseDown: col9
        borderColorFocused: colorFocused
        borderColorFocusedHovered: colorFocusedHovered
        borderColorFocusedMouseDown: brandSelected
    }

    pane: PaneTheme {
        radius:  _darkTheme.pane.radius
        backgroundColor: col16
        elevation: _darkTheme.pane.elevation
        shadowColor: _darkTheme.pane.shadowColor
    }

    popup: PopupTheme {
        radius: _darkTheme.popup.radius
        backgroundColor: col19
        elevation: _darkTheme.popup.elevation
        shadowColor: _darkTheme.popup.shadowColor
        defaultYOffset: _darkTheme.popup.defaultYOffset
    }

    icons: IconSet {
        reload: "font:," + c_METONYM_ICONS_FONT_SOURCE
        arrow_left: "font:," + c_METONYM_ICONS_FONT_SOURCE
        arrow_right: "font:," + c_METONYM_ICONS_FONT_SOURCE
        cross: "font:," + c_METONYM_ICONS_FONT_SOURCE
        tick: "font:," + c_METONYM_ICONS_FONT_SOURCE
        search: "font:," + c_METONYM_ICONS_FONT_SOURCE
        bars: "font:," + c_METONYM_ICONS_FONT_SOURCE
        splitScreenVertical: "font:," + c_METONYM_ICONS_FONT_SOURCE
        splitScreenHorizontal: "font:," + c_METONYM_ICONS_FONT_SOURCE
    }
}
