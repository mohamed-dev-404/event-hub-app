import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  //! ───────────────────────── Headings (H1 - H5) ─────────────────────────

  static const TextStyle h2 = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.normal,
    color: AppColors.title,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.title,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle h1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.title,
  );

  //! ───────────────────────── Titles & Labels ─────────────────────────

  static const TextStyle titleMediun35 = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w500,
    color: AppColors.title,
  );

  static const TextStyle title1Medium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.haifGray,
  );

  //! ───────────────────────── Body Text ─────────────────────────

  static const TextStyle mainBodyNormal16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.title,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static const TextStyle body3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.subColor,
  );

  //! ───────────────────────── Subtitles & Captions ─────────────────────────

  static const TextStyle subTitle1Medium13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );

  static const TextStyle subTitle1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static const TextStyle subTitle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryBlue,
  );

  //! ───────────────────────── Interactive Elements ─────────────────────────

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
