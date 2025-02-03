import 'package:template/app/resources/font_manager.dart';
import 'package:template/app/resources/styles_manager.dart';
import 'package:template/app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:template/app/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: AppColors.primary,
    disabledColor: AppColors.grey1,
    splashColor: AppColors.primaryOpacity70,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.grey), //ripple effect

    // primaryColorLight: AppColors.primaryOpacity70,
    // primaryColorDark: AppColors.primary,

    // card view theme
    cardTheme: CardTheme(elevation: AppSize.s4),

    // App bar theme
    appBarTheme: AppBarTheme(
        color: AppColors.primary,
        centerTitle: true,
        elevation: AppSize.s4,
        titleTextStyle:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s16)),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getMediumStyle(color: AppColors.white),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white, // Explicitly set text color

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // Text theme
    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: AppColors.darkGrey, fontSize: FontSize.s16),
        displayMedium:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
        displaySmall:
            getBoldStyle(color: AppColors.primary, fontSize: FontSize.s16),
        headlineMedium:
            getRegularStyle(color: AppColors.primary, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: AppColors.lightGrey, fontSize: FontSize.s14),
        titleSmall:
            getMediumStyle(color: AppColors.primary, fontSize: FontSize.s14),
        bodyMedium: getMediumStyle(color: AppColors.lightGrey),
        bodySmall: getRegularStyle(color: AppColors.grey1),
        bodyLarge: getRegularStyle(color: AppColors.grey)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularStyle(color: AppColors.grey1),

      // label style
      labelStyle: getMediumStyle(color: AppColors.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: AppColors.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

      // error border
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused error border
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
