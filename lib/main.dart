import 'dart:io';
import 'package:event_hub_app/core/utils/theme/app_themes.dart';
import 'package:event_hub_app/features/profile/views/organizer_Profile_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EventHub());
}

class EventHub extends StatelessWidget {
  const EventHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(),
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Container(),
        );
      },
      home: const OrganizerProfileView(),
    );
  }
}
