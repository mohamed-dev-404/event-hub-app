import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';

class NotificationActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const NotificationActionButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppStyles.button.copyWith(color: textColor),
      ),
    );
  }
}
