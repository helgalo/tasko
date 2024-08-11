import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasko/core/theme/core_colors.dart';

class CoreTextStyles {
  CoreTextStyles._();

  static TextStyle publicSans({
    FontWeightEnum fontWeight = FontWeightEnum.regular_400,
    double fontSize = 16,
    Color color = CoreColors.primaryTextColor,
  }) =>
      GoogleFonts.getFont("Public Sans").copyWith(
        fontWeight: fontWeight.fontWeight,
        fontSize: fontSize,
        height: 1,
        color: color,
      );

  static TextStyle inter({
    FontWeightEnum fontWeight = FontWeightEnum.regular_400,
    double fontSize = 16,
    Color color = CoreColors.primaryTextColor,
  }) =>
      GoogleFonts.getFont("Inter").copyWith(
        fontWeight: fontWeight.fontWeight,
        fontSize: fontSize,
        height: 1,
        color: color,
      );

  static TextStyle dmSans({
    FontWeightEnum fontWeight = FontWeightEnum.regular_400,
    double fontSize = 16,
    Color color = CoreColors.primaryTextColor,
  }) =>
      GoogleFonts.getFont("DM Sans").copyWith(
        fontWeight: fontWeight.fontWeight,
        fontSize: fontSize,
        height: 1,
        color: color,
      );
}

enum FontWeightEnum {
  thin_100,
  extraLight_200,
  light_300,
  regular_400,
  medium_500,
  semiBold_600,
  bold_700,
  extraBold_800,
  black_900,
}

extension PublicSansFontWeightExtension on FontWeightEnum {
  String get description => name;

  FontWeight get fontWeight {
    switch (this) {
      case FontWeightEnum.thin_100:
        return FontWeight.w100;
      case FontWeightEnum.extraLight_200:
        return FontWeight.w200;
      case FontWeightEnum.light_300:
        return FontWeight.w300;
      case FontWeightEnum.regular_400:
        return FontWeight.w400;
      case FontWeightEnum.medium_500:
        return FontWeight.w500;
      case FontWeightEnum.semiBold_600:
        return FontWeight.w600;
      case FontWeightEnum.bold_700:
        return FontWeight.w700;
      case FontWeightEnum.extraBold_800:
        return FontWeight.w800;
      case FontWeightEnum.black_900:
        return FontWeight.w900;
    }
  }
}
