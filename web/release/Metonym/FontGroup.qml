import QtQuick 2.15 as QtQuick

/**
 * A FontGroup is a collection of FontSources.
 * It is an abstraction that allows you to collect one or more fonts into a "familly" without
 * requiring the immediate download of all fonts like with an Open Type font collection.
 **/
QtQuick.QtObject {
    id: root

    property list<FontSource> fontSources

    property FontSource fallBackFontSource: FontSource {
        source: ''
        preferedWeight: 500
    }

    /**
     * Returns the font sources that could be used for given a font.weight and font.italic value.
     **/
    function getFontSources(weight, italic) {

        const fontSources = root.fontSources

        italic = Boolean(italic)
        weight = Font.convertFromQtWeight(weight)

        // Get the font sources which support the given weight
        let validFontSources = []
        for (let i = 0; i < fontSources.length; i++)
        {
            const fontSource = fontSources[i]
            if (fontSource.minWeight <= weight && fontSource.maxWeight <= weight )
            {
                if (!italic && fontSource.requiresItalic)
                {
                    continue
                }

                if (italic && !fontSource.supportsItalic)
                {
                    continue
                }

                validFontSources.push(fontSource)
            }
        }

        return validFontSources
    }

    /**
     * Returns the most suitable font sources that should be used for given a font.weight and
     * font.italic value.
     *
     * If there are multiple valid font sources then try to pick one based on the following
     * precendance rules:
     *  - Prefer fonts with closer "preferedWeight" values
     *  - Prefer fonts with smaller supported weight ranges
     *  - Prefer fonts that only support italic / non-italic vs both
     **/
    function getFontSource(weight, italic) {
        let validFontSources = root.getFontSources(weight, italic)
        italic = Boolean(italic)
        weight = Font.convertFromQtWeight(weight)

        if(validFontSources.length === 1) {
            return validFontSources[0]
        }
        else if(validFontSources.length === 0) {
            return root.fallBackFontSource
        }

        // Step 1 - Find the fonts with the closest "preferedWeight" value
        let minWeightDiff = Infinity
        let weightFilteredFonts = []
        for (let i = 0; i < validFontSources.length; i++)
        {
            const validFontSource = validFontSources[i]
            const weightDiff = Math.abs(validFontSource.preferedWeight - weight)
            if (weightDiff < minWeightDiff)
            {
                minWeightDiff = weightDiff
                weightFilteredFonts = [validFontSource]
            }
            else if (weightDiff === minWeightDiff)
            {
                weightFilteredFonts.push(validFontSource)
            }
        }

        if(weightFilteredFonts.length === 1) {
            return weightFilteredFonts[0]
        }

        // Step 2 - Find the font with the smallest supported weight range
        let minWeightRange = Infinity
        let weightRangeFilteredFonts = []
        for (let i = 0; i < weightFilteredFonts.length; i++)
        {
            const validFontSource = weightFilteredFonts[i]
            const weightRange = Math.abs(validFontSource.maxWeight - validFontSource.minWeight)
            if (weightRange < minWeightRange)
            {
                minWeightRange = weightRange
                weightRangeFilteredFonts = [validFontSource]
            }
            else if (weightRange === minWeightRange)
            {
                weightRangeFilteredFonts.push(validFontSource)
            }
        }

        if(weightRangeFilteredFonts.length === 1) {
            return weightFilteredFonts[0]
        }

        // Step 3 - Filter for the most specific font with respect for italics support
        let italicFilteredFonts = []
        for (let i = 0; i < weightFilteredFonts.length; i++)
        {
            const validFontSource = weightFilteredFonts[i]

            // We already know the font is valid so no need to check all cases
            if (italic && validFontSource.requiresItalic)
            {
                italicFilteredFonts.push(validFontSource)
            }
            else if(!italic && !validFontSource.supportsItalic) {
                italicFilteredFonts.push(validFontSource)
            }
        }

        if(italicFilteredFonts.length === 1)
        {
            return italicFilteredFonts[0]
        }

        if(italicFilteredFonts.length === 0)
        {
            return weightRangeFilteredFonts[0]
        }

        return italicFilteredFonts[0]
    }


    function getFont(font) {
        return root.getFontSource(font).fontLoader.name
    }
}
