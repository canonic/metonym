import QtQuick 2.15

Theme {

    // Constants
    readonly property string c_METONYM_ICONS_FONT_SOURCE: "./fonts/metonym-icons.ttf"

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

    col0: '#FFFFFF'
    col1: '#F6F6F6'
    col2: '#EBEBEB'
    col3: '#DBDBDC'
    col4: '#CBCCCD'
    col5: '#B8B9BB'
    col6: '#A9AAAD'
    col7: '#999B9E'
    col8: '#8b8d90'
    col9: '#7c7e83'
    col10: '#6f7176'
    col11: '#616368'
    col12: '#50545a'
    col13: '#404349'
    col14: '#303339'
    col15: '#22252a'
    col16: '#191c21'
    col17: '#0c0e12'
    col18: '#06070d'
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
        radius: 3
        backgroundColor: col16
        elevation: 0
        shadowColor: "#66000000"
    }

    popup: PopupTheme {
        radius: 0
        backgroundColor: col16
        elevation: 16
        shadowColor: "#66000000"
        defaultYOffset: 16
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
