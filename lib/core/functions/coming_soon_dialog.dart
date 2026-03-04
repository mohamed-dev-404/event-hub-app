import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void comingSoonDialog(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'this feature is coming soon!',
    confirmBtnColor: AppColors.primaryBlue,
  );
}
