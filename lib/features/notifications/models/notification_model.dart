class NotificationModel {
  final String image;
  final String name;
  final String message;
  final String time;
  final bool button;

  const NotificationModel({
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.button
  });
}