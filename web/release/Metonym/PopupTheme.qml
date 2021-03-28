import QtQuick 2.15

QtObject {
    required property double radius
    required property color backgroundColor
    required property double elevation
    required property color shadowColor

    // The default distance the popup is positioned from it's parent in the Y axis.
    required property int defaultYOffset
}
