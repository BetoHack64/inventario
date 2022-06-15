import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007e = fromHex('#7e000000');

  static Color whiteA7007e = fromHex('#7effffff');

  static Color whiteA700B3 = fromHex('#b3ffffff');

  static Color lightBlue700 = fromHex('#1c99c4');

  static Color blueA200 = fromHex('#618fe8');

  static Color gray50 = fromHex('#fafafa');

  static Color black900 = fromHex('#000000');

  static Color cyan900A2 = fromHex('#a21c5c57');

  static Color black90026 = fromHex('#26000000');

  static Color gray600 = fromHex('#7a7a7a');

  static Color gray700 = fromHex('#666666');

  static Color blue800 = fromHex('#1c61c4');

  static Color indigo50 = fromHex('#e6e6ff');

  static Color gray900 = fromHex('#212121');

  static Color bluegray100 = fromHex('#d1e6e3');

  static Color gray100 = fromHex('#f5f7f7');

  static Color black9000d = fromHex('#0d000000');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color bluegray600 = fromHex('#2e7d78');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#878787');

  static Color bluegray6004c = fromHex('#4c2e7d78');

  static Color bluegray101 = fromHex('#d1d1d1');

  static Color blue400 = fromHex('#36a6f0');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
