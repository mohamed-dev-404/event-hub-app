import 'package:event_hub_app/core/utils/assets/app_images.dart';
import 'package:event_hub_app/features/map/widgets/event_item.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       
        Image.asset(
          AppImages.mapView,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

    
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
             
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Find for food or restaurant...',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .05),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.gps_fixed,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

             
              SizedBox(
                height: 220, 
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    MapEventItem(
                      imagePath: AppImages.assetsImagesHomeTest1,
                      title: 'Jo Malone London’s Mother’s Day Presents',
                      date: 'Wed, Apr 28 • 5:30 PM',
                      location: 'Radius Gallery • Santa Cruz, CA',
                    ),
                    MapEventItem(
                      imagePath: AppImages.assetsImagesSmallTest3,
                      title: 'A Virtual Evening of Smooth Jazz',
                      date: 'Sat, May 1 • 2:00 PM',
                      location: 'Lot 13 • Oakland, CA',
                    ),
                    MapEventItem(
                      imagePath: AppImages.assetsImagesSmallTest4,
                      title: "Women's Leadership Conference 2021",
                      date: 'Sat, Apr 24 • 1:30 PM',
                      location: '53 Bush St • San Francisco, CA',
                    ),
                    MapEventItem(
                      imagePath: AppImages.assetsImagesSmallTest2,
                      title: 'International Kids Safe Parents Night Out',
                      date: 'Fri, Apr 23 • 6:00 PM',
                      location: 'Lot 13 • Oakland, CA',
                    ),
                    MapEventItem(
                      imagePath: AppImages.homeTest0,
                      title: 'Collectivity Plays the Music of Jimi',
                      date: 'Mon, Jun 21 • 10:00 PM',
                      location: 'Longboard Margarita Bar',
                    ),
                    MapEventItem(
                      imagePath: AppImages.assetsImagesSmallTest1,
                      title: 'International Gala Music Festival',
                      date: 'Sun, Apr 25 • 10:15 AM',
                      location: '36 Guild Street London, UK',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16), 
            ],
          ),
        ),
      ],
    );
  }
}