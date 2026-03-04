class EventModel {
  final String id;
  final String title;

  //* Date & Time Formatting
  final String shortDate; // e.g., "10\nJUNE" (For Home Upcoming Card)
  final String
  listDateString; // e.g., "1ST MAY- SAT -2:00 PM" (For Home Nearby / Search)
  final String fullDate; // e.g., "14 December, 2021" (For Details Screen)
  final String
  timeRange; // e.g., "Tuesday, 4:00PM - 9:00PM" (For Details Screen)

  //* Location details
  final String locationName; // e.g., "Gala Convention Center"
  final String locationAddress; // e.g., "36 Guild Street London, UK"

  //* Event Meta
  final int goingCount;
  final List<String> attendeeImages;
  final String imageAsset; // Main event cover image
  final bool isBookmarked;
  final double ticketPrice; // e.g., 120.0 (For Details Screen "Buy Ticket")

  //* Organizer Details
  final String organizerName;
  final String organizerRole;
  final String organizerAvatarAsset;
  final String aboutDescription;

  EventModel({
    required this.id,
    required this.title,
    required this.shortDate,
    required this.listDateString,
    required this.fullDate,
    required this.timeRange,
    required this.locationName,
    required this.locationAddress,
    required this.goingCount,
    required this.attendeeImages,
    required this.imageAsset,
    this.isBookmarked = false,
    required this.ticketPrice,
    required this.organizerName,
    required this.organizerRole,
    required this.organizerAvatarAsset,
    required this.aboutDescription,
  });
}
