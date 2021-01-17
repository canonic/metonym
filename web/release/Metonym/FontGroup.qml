import QtQuick 2.15

QtObject {
    required property FontSources sources

    readonly property FontLoader thin: FontLoader {
        source: sources.thin
    }

    readonly property FontLoader light: FontLoader {
        source: sources.light
    }

    readonly property FontLoader regular: FontLoader {
        source: sources.regular
    }

    readonly property FontLoader medium: FontLoader {
        source: sources.medium
    }

    readonly property FontLoader semiBold: FontLoader {
        source: sources.semiBold
    }

    readonly property FontLoader bold: FontLoader {
        source: sources.bold
    }

    readonly property FontLoader extraBold: FontLoader {
        source: sources.extraBold
    }

    readonly property FontLoader black: FontLoader {
        source: sources.black
    }

    readonly property FontLoader thinItalic: FontLoader {
        source: sources.thinItalic
    }

    readonly property FontLoader lightItalic: FontLoader {
        source: sources.lightItalic
    }

    readonly property FontLoader regularItalic: FontLoader {
        source: sources.regularItalic
    }

    readonly property FontLoader mediumItalic: FontLoader {
        source: sources.mediumItalic
    }

    readonly property FontLoader semiBoldItalic: FontLoader {
        source: sources.semiBoldItalic
    }

    readonly property FontLoader boldItalic: FontLoader {
        source: sources.boldItalic
    }

    readonly property FontLoader extraBoldItalic: FontLoader {
        source: sources.extraBoldItalic
    }

    readonly property FontLoader blackItalic: FontLoader {
        source: sources.blackItalic
    }

}
