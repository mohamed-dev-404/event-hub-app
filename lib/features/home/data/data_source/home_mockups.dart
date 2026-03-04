import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/features/home/data/models/category_model.dart';

class HomeMockData {
  //! --- CATEGORIES ---
  static List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      iconAsset: AppIcons.assetsIconsBall,
      color: AppColors.red,
    ),
    CategoryModel(
      id: '2',
      name: 'Music',
      iconAsset: AppIcons.assetsIconsMusic,
      color: AppColors.orange,
    ),
    CategoryModel(
      id: '3',
      name: 'Food',
      iconAsset: AppIcons.assetsIconsFood,
      color: AppColors.green,
    ),
    CategoryModel(
      id: '4',
      name: 'Art',
      iconAsset: AppIcons.assetsIconsArt,
      color: AppColors.babyBlue,
    ),
  ];

  //! --- UPCOMING EVENTS (Horizontal Scroll) ---
  static List<EventModel> upcomingEvents = [
    EventModel(
      id: 'e1',
      title: 'International Band Music Concert',
      shortDate: '10\nJUNE',
      listDateString: '10 JUNE - 4:00 PM',
      fullDate: '14 December, 2021',
      timeRange: 'Tuesday, 4:00PM - 9:00PM',
      locationName: 'Gala Convention Center',
      locationAddress: '36 Guild Street London, UK',
      goingCount: 20,
      attendeeImages: [
        AppImages.profile,
        AppImages.profile,
        AppImages.profile,
      ], // Replace with distinct avatars if you have them
      imageAsset: AppImages.assetsImagesHomeTest1,
      isBookmarked: true,
      ticketPrice: 120.0,
      organizerName: 'Ashfak Sayem',
      organizerRole: 'Organizer',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'Enjoy your favorite dishes and a lovely time with your friends and family and have a great time. Food from local food trucks will be available for purchase.',
    ),
    EventModel(
      id: 'e2',
      title: 'Jo Malone London',
      shortDate: '10\nJUNE',
      listDateString: '10 JUNE - 8:00 PM',
      fullDate: '15 December, 2021',
      timeRange: 'Wednesday, 8:00PM - 11:00PM',
      locationName: 'Radius Gallery',
      locationAddress: 'Santa Cruz, CA',
      goingCount: 10,
      attendeeImages: [
        AppImages.profile,
        AppImages.profile,
        // AppImages.profile,
      ],
      imageAsset: AppImages.assetsImagesHomeTest2,
      isBookmarked: false,
      ticketPrice: 85.0,
      organizerName: 'Radius Gallery',
      organizerRole: 'Host',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'Join us for an exclusive event featuring Jo Malone London. Discover new scents and enjoy a wonderful evening.',
    ),
  ];

  //! --- NEARBY EVENTS (Vertical Scroll) ---
  static List<EventModel> nearbyEvents = [
    EventModel(
      id: 'n1',
      title: "Women's leadership conference",
      shortDate: '1\nMAY',
      listDateString: '1ST MAY- SAT -2:00 PM',
      fullDate: '1 May, 2021',
      timeRange: 'Saturday, 2:00PM - 6:00PM',
      locationName: 'Radius Gallery',
      locationAddress: 'Santa Cruz',
      goingCount: 50,
      attendeeImages: [],
      imageAsset: AppImages.assetsImagesSmallTest1,
      isBookmarked: true,
      ticketPrice: 0.0,
      organizerName: 'Women in Tech',
      organizerRole: 'Organizer',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'A conference dedicated to empowering women in leadership roles.',
    ),
    EventModel(
      id: 'n2',
      title: 'International Kids Safe Parents Night',
      shortDate: '23\nAPR',
      listDateString: 'FRI, APR 23 - 6:00 PM',
      fullDate: '23 April, 2021',
      timeRange: 'Friday, 6:00PM - 10:00PM',
      locationName: 'Lot 13',
      locationAddress: 'Oakland, CA',
      goingCount: 15,
      attendeeImages: [],
      imageAsset: AppImages.assetsImagesSmallTest2,
      isBookmarked: false,
      ticketPrice: 20.0,
      organizerName: 'Safe Kids Org',
      organizerRole: 'Organizer',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'A night for parents to learn about child safety in a fun environment.',
    ),
    EventModel(
      id: 'n3',
      title: 'A Virtual Evening of Smooth Jazz',
      shortDate: '1\nMAY',
      listDateString: 'SAT, MAY 1 - 2:00 PM',
      fullDate: '1 May, 2021',
      timeRange: 'Saturday, 2:00PM - 4:00PM',
      locationName: 'Online Event',
      locationAddress: 'Virtual',
      goingCount: 120,
      attendeeImages: [],
      imageAsset: AppImages.assetsImagesSmallTest3,
      isBookmarked: true,
      ticketPrice: 10.0,
      organizerName: 'Jazz Society',
      organizerRole: 'Host',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'Relax and unwind with the best jazz musicians performing live online.',
    ),
    EventModel(
      id: 'n4',
      title: 'International Gala Music Festival',
      shortDate: '25\nAPR',
      listDateString: 'SUN, APR 25 - 10:15 AM',
      fullDate: '25 April, 2021',
      timeRange: 'Sunday, 10:15AM - 11:00PM',
      locationName: 'Gala Center',
      locationAddress: '36 Guild Street London, UK',
      goingCount: 500,
      attendeeImages: [],
      imageAsset: AppImages.assetsImagesSmallTest4,
      isBookmarked: false,
      ticketPrice: 150.0,
      organizerName: 'Global Events',
      organizerRole: 'Organizer',
      organizerAvatarAsset: AppImages.profile,
      aboutDescription:
          'The biggest music festival of the year featuring global artists.',
    ),
  ];
}
