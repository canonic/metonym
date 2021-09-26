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

        {
            const stylesTheme = Styles.theme
            if (stylesTheme)
            {
                return stylesTheme
            }
        }

        throw "No theme set"
    }
}
