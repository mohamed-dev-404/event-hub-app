import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/features/profile/models/interst_model.dart';
import 'package:flutter/material.dart';

class InterestChip extends StatelessWidget {
  final InterestModel interest;
  final VoidCallback? onTap;

  const InterestChip({
    super.key,
    required this.interest,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: interest.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          interest.title,
          style: AppStyles.body2, 
        ),
      ),
    );
  }
}