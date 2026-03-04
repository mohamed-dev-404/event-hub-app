import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/features/notifications/models/notification_model.dart';
import 'package:event_hub_app/features/notifications/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
    final List<NotificationModel> notifications = [
  const NotificationModel(
    image: AppImages.profile,
    name: 'David Silbia',
    message: 'Invite Jo Malone London’s Mother’s',
    time: 'Just now', button: true,
  ),
  const NotificationModel(
    image: AppImages.profile,
    name: 'Adnan Safi',
    message: 'Started following you',
    time: '5 min ago',
    button: false
  ),
  const NotificationModel(
    image: AppImages.profile,
    name: 'Joan Baker',
    message: 'Invite A virtual Evening of Smooth Jazz',
    time: '20 min ago',
    button: true,
  ),
  const NotificationModel(
    image: AppImages.profile,
    name: 'Ronald C. Kinch',
    message: 'Like you events',
    time: '1 hr ago',
        button: false

  ),
  const NotificationModel(
    image: AppImages.profile,
    name: 'Clara Tolson',
    message: 'Join your Event Gala Music Festival',
    time: '9 hr ago',
    button: true,
  ),
  const NotificationModel(
    image: AppImages.profile,
    name: 'Jennifer Fritz',
    message: 'Invite you International Kids Safe',
    time: 'Tue, 5:10 pm',
        button: false

  ),


];
   NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Notifications'), 
        titleSpacing: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationItem(
              model: notifications[index],
            );
          },
        ),
      ),
    );
  }
}