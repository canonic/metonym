import QtQuick 2.15

Item {
    id: root

    Item {
        id: __hiddenContainer
        visible: false
    }

    property Theme theme: {

        // Inherit the parents theme
        var parent = root.parent

        while(parent)
        {
            if(parent instanceof ThemedItem)
            {
                var parentTheme = parent.theme
                if(parentTheme)
                {
                    return parentTheme
                }
            }

            parent = parent.parent
        }

        // If unable to inherit the theme then try the global window object
        if (typeof window !== 'undefined') {
            var themeSource = window.themeSource

            if(themeSource !== null)
            {
                // If the global window object does not have a theme them we need to create one
                var themeComponent = Qt.createComponent(themeSource);
                return themeComponent.createObject(__hiddenContainer)
            }

            return theme
        }

        throw "No theme set"
    }
}
