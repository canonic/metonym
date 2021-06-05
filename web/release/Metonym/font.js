.pragma library
.import QtQuick 2.15 as QtQuick

/**
 * Based on common weight name mappings defined by the Mozilla Developer Network [1] which is in
 * turn based on the Open Type spec.
 *
 * -----------------------------------------
 * | Names                       | Weights |
 * |---------------------------------------|
 * | Thin / Hairline             | 100     |
 * | Extra-light / Ultra-light   | 200     |
 * | Light                       | 300     |
 * | Normal / regular            | 400     |
 * | Medium                      | 500     |
 * | Semi-bold / Demi-bold       | 600     |
 * | Bold                        | 700     |
 * | Extra-bold / Ultra-bold 	  | 800     |
 * | Heavy / Black               | 900     |
 * | Extra-black / Ultra-black   | 950     |
 * -----------------------------------------
 *
 * Note that the weight is defined by the OpenType font spec which was in tern defined by
 * Microsoft and Adobe. Note that just because a font ends in .ttf does not mean it is a True
 * Type font as .ttf fonts can be Open Type or True Type thanks to a quirk of history.
 *
 * [1] https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#common_weight_name_mapping
 **/
const Weight = {
    Thin        : 100,
    ExtraLight  : 200,
    Light       : 300,
    Regular     : 400,
    Medium      : 500,
    SemiBold    : 600,
    Bold        : 700,
    ExtraBold   : 800,
    Black       : 900,
    ExtraBlack  : 950
};

/**
 * Based on Qt's own definition of weights (If anyone knows the rational behind these weight
 * values please tell as they appear to not conform to any known standard.)
 **/
const QtWeight = {
    Thin        : 0,
    ExtraLight  : 12,
    Light       : 25,
    Regular     : 50,
    Medium      : 57,
    SemiBold    : 63,
    Bold        : 75,
    ExtraBold   : 81,
    Black       : 87
}

/**
 * Takes a standard font weight value (int) as defined by the Open Type Font specification
 * and converts it to a Qt font weight value (int).
 */
function convertToQtWeight(weight)
{
    switch(weight) {
      case Weight.Thin:
        return QtQuick.Font.Thin

      case Weight.ExtraLight:
        return QtQuick.Font.ExtraLight

      case Weight.Light:
        return QtQuick.Font.Light

      case Weight.Regular:
        return QtQuick.Font.Normal

      case Weight.Medium:
        return QtQuick.Font.Medium

      case Weight.SemiBold:
        return QtQuick.Font.DemiBold

      case Weight.ExtraBold:
        return QtQuick.Font.ExtraBold

      case Weight.Black:
        return QtQuick.Font.Black

      default:
        return Math.floor(weight / 10)
    }
}

/**
 * Takes a Qt font weight value (int) and converts it to a standard font weight value (int)
 * as defined by the Open Type Font specification.
 */
function convertFromQtWeight(qtWeight)
{
    switch(qtWeight) {
      case QtQuick.Font.Thin:
        return Weight.Thin

      case QtQuick.Font.ExtraLight:
        return Weight.ExtraLight

      case QtQuick.Font.Light:
        return Weight.Light

      case QtQuick.Font.Normal:
        return Weight.Regular

      case QtQuick.Font.Medium:
        return Weight.Medium

      case QtQuick.Font.DemiBold:
        return Weight.SemiBold

      case QtQuick.Font.ExtraBold :
        return Weight.ExtraBold

      case QtQuick.Font.Black:
        return Weight.Black

      default:
        return Math.floor(qtWeight * 10)
    }
}
