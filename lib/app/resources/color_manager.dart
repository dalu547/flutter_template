import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const primary = Color(0xff13968E);
  static const primaryDark = Color(0xff0E7E78);
  static const primaryLight = Color(0xffC2E4E2);

  // Transparent color
  static const transparent = Color(0x00000000);

  // Secondary colors
  static const secondary = Color(0xffD27722);
  static const secondaryDark = Color(0xffC26B1B);

  // Error colors
  static const error = Color(0xffBF283A);
  static const errorLight = Color(0xffF27E8C);

  // Success colors
  static const success = Color(0xff28BF64);
  static const successLight = Color(0xff8FEDB4);
  static const successDark = Color(0xff19A450);

  // Info colors
  static const info = Color(0xff2092E4);
  static const infoLight = Color(0xff9BD5FF);
  static const infoDark = Color(0xff1479C2);

  // Warning colors
  static const warning = Color(0xffE49620);
  static const warningDark = Color(0xffC47B0D);

  // Background and surface colors
  static const background = Color(0xffF3F1F1);
  static const neutral = Color(0xffF4F7FB);
  static const surface = Color(0xffFFFFFF);
  static const paper = Color(0xffFFFFFF);

  // Text colors on different backgrounds
  static const onPrimary = Color(0xffFFFFFF);
  static const onSecondary = Color(0xffFFFFFF);
  static const onError = Color(0xffffffff);

  // Various shades of grey
  static const lightGery = Color(0xff607079);
  static const grey900 = Color(0xff354752);
  static const grey700 = Color(0xff607079);
  static const grey500 = Color(0xff8798A1);
  static const grey300 = Color(0xffC8D3D9);

  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
