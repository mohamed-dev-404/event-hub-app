import 'package:event_hub_app/core/utils/styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppTheme {
  AppTheme._();
  static final _borderRadius = BorderRadius.circular(15);
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppFonts.airbnbCereal,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlue,
        brightness: Brightness.light,
      ),

      textTheme: _buildTextTheme(),
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      floatingActionButtonTheme: _buildFABTheme(),
      extensions: [
        SmoothPageIndicatorTheme(
          effect: const SwapEffect(
            type: SwapType.yRotation,
            dotHeight: 8,
            dotWidth: 8,
          ),
          defaultColors: DefaultIndicatorColors(
            active: AppColors.white,
            inactive: AppColors.white.withValues(alpha: .3),
          ),
        ),
      ],
    );
  }

  static TextTheme _buildTextTheme() {
    return ThemeData.light().textTheme.apply(
      bodyColor: AppColors.subColor,
      displayColor: AppColors.paragraph,
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.title,
      centerTitle: false,
      titleSpacing: 8,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.title, size: 24),
      titleTextStyle: AppStyles.h4,
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.darkGray,
        disabledForegroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
        ),
        textStyle: AppStyles.button,
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      prefixIconColor: AppColors.iconGry,
      suffixIconColor: AppColors.iconGry,
      errorStyle: AppStyles.body3.copyWith(
        color: AppColors.red,
      ),
      errorMaxLines: 7,
      hintStyle: AppStyles.body3,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.strokGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.strokGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.primaryBlue),
      ),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.white;
        }
        if (states.contains(WidgetState.error)) {
          return AppColors.red.withAlpha(20);
        }
        return AppColors.white;
      }),
    );
  }

  static FloatingActionButtonThemeData _buildFABTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      elevation: 6,
      shape: CircleBorder(),
    );
  }
}
