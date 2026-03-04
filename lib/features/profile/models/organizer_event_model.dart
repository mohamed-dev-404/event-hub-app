import 'package:flutter/material.dart';

class OrganizerEventModel {
  final String dayAndTime;
  final String title;
  final String subtitle;
  final String imagePath;
  final Color imageBackgroundColor;

  const OrganizerEventModel({
    required this.dayAndTime,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.imageBackgroundColor = Colors.transparent,
  });
}
