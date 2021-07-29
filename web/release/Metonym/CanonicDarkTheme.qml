import QtQuick 2.15 as QtQuick

Theme {
    id: root

    // Constants
    readonly property string c_METONYM_ICONS_FONT_SOURCE: "./fonts/metonym-icons.ttf"

    font1: FontGroup {
        fontSources: [
            FontSource {
                source: './fonts/Montserrat-Thin.ttf'
                preferedWeight: Font.Weight.Thin
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-Light.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-LightItalic.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-Regular.ttf'
                preferedWeight: Font.Weight.Regular
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-Medium.ttf'
                preferedWeight: Font.Weight.Medium
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-SemiBold.ttf'
                preferedWeight: Font.Weight.SemiBold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-Bold.ttf'
                preferedWeight: Font.Weight.Bold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: true
            },

            FontSource {
                source: './fonts/Montserrat-ExtraBold.ttf'
                preferedWeight: Font.Weight.ExtraBold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Montserrat-Black.ttf'
                preferedWeight: Font.Weight.Black
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            }
        ]
    }

    font2: FontGroup {
        fontSources: [
            FontSource {
                source: './fonts/Garnet-Capitals-Light.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/Garnet-Capitals-Bold.ttf'
                preferedWeight: Font.Weight.Bold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: true
            }
        ]
    }

    font3: FontGroup {
        fontSources: [
            FontSource {
                source: './fonts/SourceCodePro-ExtraLight.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-ExtraLightIt.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-Light.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-LightIt.ttf'
                preferedWeight: Font.Weight.Light
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-Regular.ttf'
                preferedWeight: Font.Weight.Regular
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-It.ttf'
                preferedWeight: Font.Weight.Regular
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-Medium.ttf'
                preferedWeight: Font.Weight.Medium
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-MediumIt.ttf'
                preferedWeight: Font.Weight.Medium
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-Semibold.ttf'
                preferedWeight: Font.Weight.SemiBold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-SemiboldIt.ttf'
                preferedWeight: Font.Weight.SemiBold
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-Bold.ttf'
                preferedWeight: Font.Weight.Bold
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: true
            },

            FontSource {
                source: './fonts/SourceCodePro-BoldIt.ttf'
                preferedWeight: Font.Weight.Bold
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: true
            },

            FontSource {
                source: './fonts/SourceCodePro-Black.ttf'
                preferedWeight: Font.Weight.Black
                supportsItalic: false
                supportsNonItalic: true
                requiresItalic: false
                requiresBold: false
            },

            FontSource {
                source: './fonts/SourceCodePro-BlackIt.ttf'
                preferedWeight: Font.Weight.Black
                supportsItalic: true
                supportsNonItalic: false
                requiresItalic: true
                requiresBold: false
            }
        ]
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

    button: ButtonTheme {
        defaultColor: col3
        hoverColor: col0
        pressedColor: getInterpolatedColour(11.5)

        defaultFocusedColor: '#15E888'
        hoverFocusedColor: col20
        pressedFocusedColor: '#10804E'

        backgroundColor: pane.backgroundColor
        backgroundHoveredColor: getInterpolatedColour(14.3)
        backgroundPressedColor: getInterpolatedColour(16.9)
    }

    label: LabelTheme {
        fontGroup: root.font1
    }

    link: LinkTheme {
        defaultColor: col22
        hoverColor: '#4FA6FC'
        pressedColor: '#217EDB'

        defaultFocusedColor: defaultColor
        hoverFocusedColor: hoverColor
        pressedFocusedColor: pressedColor
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

    textField: TextFieldTheme {
        fontGroup: root.font1
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
        angleUp: "font:," + c_METONYM_ICONS_FONT_SOURCE
        angleDown: "font:," + c_METONYM_ICONS_FONT_SOURCE
        home: "font:," + c_METONYM_ICONS_FONT_SOURCE
        empty: "font:," + c_METONYM_ICONS_FONT_SOURCE
        circle: "font:," + c_METONYM_ICONS_FONT_SOURCE
        githubMark: "font:," + c_METONYM_ICONS_FONT_SOURCE
        qt: "font:," + c_METONYM_ICONS_FONT_SOURCE
        discord: "font:," + c_METONYM_ICONS_FONT_SOURCE
        day: "font:," + c_METONYM_ICONS_FONT_SOURCE
        night: "font:," + c_METONYM_ICONS_FONT_SOURCE
        user: "font:," + c_METONYM_ICONS_FONT_SOURCE
        canonic: "font:," + c_METONYM_ICONS_FONT_SOURCE
        blender: "font:," + c_METONYM_ICONS_FONT_SOURCE
        blenderArtistOrg: "font:," + c_METONYM_ICONS_FONT_SOURCE
    }
}
