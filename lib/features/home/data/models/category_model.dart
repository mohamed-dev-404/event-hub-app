import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String iconAsset; // Using SVG paths
  final Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconAsset,
    required this.color,
  });
}
