pragma Singleton
import QtQuick 2.15


QtObject {
    readonly property color colourBlue: "blue"

    readonly property color brandColor: '#1cfe98'
    readonly property color inverseBrandColor: '#e30167'

    readonly property color brandColorDefault: '#15E888'
    readonly property color brandColorHover: brandColor
    readonly property color brandColorSelected: '#10804E'
    readonly property color brandColorPressed: '#12965A'
    readonly property color brandColorPressed2: '#17ca79'

    readonly property color backgroundColor: '#06070d'
    readonly property color backgroundColor2: '#191c21'
    readonly property color backgroundColor3: '#0c0e12'

    readonly property color bloomColor: '#55ffffff'
    readonly property color bloomColorSelected: '#aaffffff'

    readonly property color operationColorPrimary: '#191919'//'#c0c0c0' // '#36cbf4'
    readonly property color operationColorSecondary: '#191919'//'#d0d0d0' // '#6978fd'

    readonly property color operationColorPrimarySelected: 'white' // '#ea448a'
    readonly property color operationColorSecondarySelected: 'white' // '#e8484c'

    readonly property color operationGlowColorPrimary: '#45FFE4'//'#c86dd7'
    readonly property color operationGlowColorSecondary: '#456AFF'//'#45c2ff'//'#7579e1'

    readonly property color operationGlowColorPrimarySelected: operationGlowColorPrimary
    readonly property color operationGlowColorSecondarySelected: operationGlowColorSecondary

    readonly property color connectionColorStart: '#191919'
    readonly property color connectionColorEnd: '#191919'

    readonly property color interpreterColorPrimary: '#19e88b'
    readonly property color interpreterColorSecondary: '#00b896'

    readonly property color interpreterColorPrimarySelected: '#3affa5'
    readonly property color interpreterColorSecondarySelected: '#04deb5'

    readonly property color transactionColor: "#161a1f"
    readonly property color transactionHoverColor: '#232528'

    readonly property color borderColor: '#888888'

    readonly property real glowRadius: 24
    readonly property real interpreterGlowRadius: glowRadius
    readonly property real operationGlowRadius: glowRadius
    readonly property real connectionGlowRadius: glowRadius

    // Fonts can be found here:
    // https://github.com/google/fonts/tree/master/ofl/montserrat

    readonly property var monterratThin: FontLoader {
        source: "./fonts/Montserrat-Thin.ttf"
    }

    readonly property var monterratLight: FontLoader {
        source: "./fonts/Montserrat-Light.ttf"  //"https://github.com/google/fonts/blob/master/ofl/montserrat/Montserrat-Light.ttf?raw=true"
    }

    readonly property var monterratLightItalic: FontLoader {
        source: "./fonts/Montserrat-LightItalic.ttf"
    }

    readonly property var monterratRegular: FontLoader {
        source: "./fonts/Montserrat-Regular.ttf"  //"https://github.com/google/fonts/blob/master/ofl/montserrat/Montserrat-Regular.ttf?raw=true"
    }

    readonly property var monterratMedium: FontLoader {
        source: "./fonts/Montserrat-Medium.ttf"  //"https://github.com/google/fonts/raw/master/ofl/montserrat/Montserrat-Medium.ttf?raw=true"
    }

    readonly property var monterratSemiBold: FontLoader {
        source: "./fonts/Montserrat-SemiBold.ttf"  //"https://github.com/google/fonts/blob/master/ofl/montserrat/Montserrat-SemiBold.ttf?raw=true"
    }

    readonly property var monterratBold: FontLoader {
        source: "./fonts/Montserrat-Bold.ttf"
    }

    readonly property var monterratExtraBold: FontLoader {
        source: "./fonts/Montserrat-ExtraBold.ttf"
    }

    readonly property var monterratBlack: FontLoader {
        source: "./fonts/Montserrat-Black.ttf"
    }

    readonly property var faRegular: FontLoader {
        source: "./fonts/fa-regular-400.ttf"
    }

    readonly property var metonymIcons: FontLoader {
        source: "./fonts/metonym-icons.ttf"
    }

    // --- Source code pro
    readonly property var sourceCodeProRegular: FontLoader {
        source: "./fonts/SourceCodePro-Regular.ttf"  //"https://github.com/adobe-fonts/source-code-pro/blob/release/TTF/SourceCodePro-Regular.ttf?raw=true"
    }

    // Address bar
    readonly property color addressBarBorderDefualtColor: '#323439'
    readonly property color addressBarBorderHoveredColor: '#54555d'

    // User profile btn
    readonly property color userProfileBtnBackgroundColor: backgroundColor3
    readonly property color userProfileBtnBorderDefualtColor: addressBarBorderDefualtColor
    readonly property color userProfileBtnBorderHoveredColor: addressBarBorderHoveredColor

    // IDE
    readonly property real ideFontPointSize: 14
    readonly property color ideBackgroundColor: '#dd111218'
    readonly property color ideBlockBackgroundColor: '#00202125'
    readonly property color ideBlockHoveredBackgroundColor: '#77202125'
    readonly property color ideBlockSelectedBackgroundColor: '#dd202125'
    readonly property color ideTextSelectedBackgroundColor: '#444444'
    readonly property color ideTextSelectedFocusBackgroundColor: '#264f78'
    readonly property color ideLineNumberColor: '#666666'
    readonly property color ideLineNumberSelectedColor: '#9d9d9d'
    readonly property color ideOperationLableColor: '#676767'
    readonly property color ideOperationLableBackgroundColor: '#0e0e0e'
    readonly property color ideOperationDescriptionColor: '#474747'
    readonly property real ideOperationLableFontPointSize: 10

    // TableView
    readonly property color tableViewColor: '#111218'

    readonly property real tableViewHeaderHeight: 60
    readonly property real tableViewHeaderPadding: tableViewHeaderHeight

    readonly property color rowBackgroundColor: tableViewColor
    readonly property color rowBackgroundColorAlternate: 'grey'

    readonly property color rowHoveredBackgroundColor: '#25262A'
    readonly property color rowHoveredBackgroundColorAlternate: 'grey'

    readonly property color rowSelecedBackgroundColor: 'grey'
    readonly property color rowSelecedBackgroundColorAlternate: 'grey'

    // Button
    readonly property color buttonColorDefault: '#DADADA'
    readonly property color buttonColorHover: 'white'
    readonly property color buttonColorDown: '#575757'

    readonly property color buttonColorFocusedDefault: brandColorDefault
    readonly property color buttonColorFocusedHover: brandColorHover
    readonly property color buttonColorFocusedDown: brandColorSelected

    readonly property color buttonBackgroundDefault: '#1C1D25'
    readonly property color buttonBackgroundHovered: rowHoveredBackgroundColor
    readonly property color buttonBackgroundPressed: '#111218'

    readonly property color buttonBorderGlowColorDefault: 'white'
    readonly property color buttonBorderGlowColorFocusedDefault: brandColor

    readonly property color buttonBorderDefaultColor: addressBarBorderDefualtColor
    readonly property color buttonBorderHoveredColor: addressBarBorderHoveredColor
    readonly property color buttonBorderMouseDownColor: addressBarBorderHoveredColor

    // MenuBar Item
    readonly property color menuBarItemColorDefault: buttonColorDefault
    readonly property color menuBarItemColorHighlighted: buttonColorHover
    readonly property color menuBarItemColorPressed: buttonColorDown

    readonly property color menuBarItemColorOpenedDefault: 'black'
    readonly property color menuBarItemColorOpenedHighlighted: 'black'
    readonly property color menuBarItemColorOpenedPressed: 'black'

    readonly property color menuBarItemBackgroundColorDefault: buttonBackgroundDefault
    readonly property color menuBarItemBackgroundColorHighlighted: buttonBackgroundHovered
    readonly property color menuBarItemBackgroundColorPressed: buttonBackgroundPressed

    readonly property color menuBarItemBackgroundColorOpenedDefault: brandColorDefault
    readonly property color menuBarItemBackgroundColorOpenedHovered: brandColorHover
    readonly property color menuBarItemBackgroundColorOpenedPressed: brandColorPressed

    // Menu Item
    readonly property int menuItemHeight: 32
    readonly property int menuItemLeftBarWidth: 4

    // Popup
    readonly property int popupTopMargin: 10
    readonly property int popupPadding: 10

    // Klatah Repo styes
    readonly property real __cubicOffsetModifier: 1.3
    readonly property int __gridWidthAndHeight: 200
    readonly property int __operationRadius: 60
}


