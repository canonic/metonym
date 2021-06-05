import QtQuick 2.15

QtObject {
    id: root

    required property url source
    required property int preferedWeight
    property int minWeight: preferedWeight
    property int maxWeight: preferedWeight

    // Is the font designed to support use with italic text
    property bool supportsItalic: false

    // Is the font designed to support use with non italic text
    property bool supportsNonItalic: true

    // Does the font require Font.italic to be true to work
    property bool requiresItalic: supportsItalic && !supportsNonItalic

    // Does the font require Font.bold to be true to work
    property bool requiresBold: false

    readonly property FontLoader fontLoader: FontLoader {
        id: _fontLoader
        source: root.source
    }
}
