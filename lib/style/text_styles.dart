import 'package:flutter/widgets.dart' show TextStyle, FontWeight;
import 'package:xafe/style/colors.dart';

class XfFonts {
  ///
  /// FONT-FAMILY EUCLID
  ///
  static const euclid = "Euclid";
}

class XfTextStyle {
  static const TextStyle regular = TextStyle(
    fontFamily: XfFonts.euclid,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: XfFonts.euclid,
  );

  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: XfFonts.euclid,
  );

  static final TextStyle black = TextStyle(
    fontFamily: XfFonts.euclid,
    fontWeight: FontWeight.w900,
  );

  static TextStyle get header {
    return black.copyWith(
      fontSize: 80,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get header55 {
    return bold.copyWith(
      fontSize: 55,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get header60 {
    return bold.copyWith(
      fontSize: 60,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get subTitle {
    return regular.copyWith(fontSize: 40, color: XfColors.ash,);
  }

  static TextStyle get body {
    return regular.copyWith(fontSize: 45);
  }

  static TextStyle get body1 {
    return regular.copyWith(fontSize: 50);
  }

  static TextStyle get body2 {
    return regular.copyWith(fontSize: 60);
  }

  static TextStyle get button {
    return medium.copyWith(fontSize: 50);
  }
}
