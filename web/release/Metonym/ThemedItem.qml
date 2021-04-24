import QtQuick 2.15

Item {
    id: root

    property Item inheritanceParent: parent

    Item {
        id: __hiddenContainer
        visible: false
    }

    property Theme theme: {

        // Inherit the parents theme
        var parent = root.inheritanceParent

        while(parent)
        {
            const parentTheme = parent.theme
            if (parentTheme && parentTheme instanceof Theme)
            {
                return parentTheme
            }

            parent = parent.parent
        }

        // If unable to inherit the theme then try the global window object
        if (typeof window !== 'undefined') {
            const themeComponent = window.themeComponent

            if(themeComponent !== null && themeComponent.status === Component.Ready )
            {
                const themeObject = themeComponent.createObject(__hiddenContainer)
                if (themeObject instanceof Theme)
                {
                    return themeObject
                }
            }
        }

        throw "No theme set"
    }
}
