import 'package:event_hub_app/core/functions/coming_soon_dialog.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/features/events/views/events_view.dart';
import 'package:event_hub_app/features/home/views/home_view.dart';
import 'package:event_hub_app/features/map/views/map_view.dart';
import 'package:event_hub_app/features/nav_bar/widgets/nav_bar_item.dart';
import 'package:event_hub_app/features/profile/views/my_profile_view.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  // Current Index Tracker
  int _currentIndex = 0;

  // List of Views (tabs)
  final List<Widget> _views = [
    const HomeView(),
    const EventsView(),
    const MapView(),
    const MyProfileView(),
  ];

  // Logic to update index
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      // The FAB for the centered "+" button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(),

      // Using IndexedStack to keep pages alive in memory
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 90.0,
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: _views,
        ),
      ),

      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildFab() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: .4),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          comingSoonDialog(context);
        },
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        shape: const CircleBorder(),
        child: const CustomSvgPicture(
          path: AppIcons.assetsIconsAddBox,
          color: AppColors.white,
          height: 20,
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Left Side
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarItem(
                    label: 'Explore',
                    icon: AppIcons.assetsIconsExplore,
                    isSelected: _currentIndex == 0,
                    onTap: () => _onTabTapped(0),
                  ),
                  NavBarItem(
                    label: 'Events',
                    icon: AppIcons.assetsIconsCalendarSolid,
                    isSelected: _currentIndex == 1,
                    onTap: () => _onTabTapped(1),
                  ),
                ],
              ),
            ),

            //* The exact width of the FAB container (60)
            const SizedBox(width: 60),

            //* Right Side
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarItem(
                    label: 'Map',
                    icon: AppIcons.assetsIconsLocationSolid,
                    isSelected: _currentIndex == 2,
                    onTap: () => _onTabTapped(2),
                  ),
                  NavBarItem(
                    label: 'Profile',
                    icon: AppIcons.assetsIconsPersonSolid,
                    isSelected: _currentIndex == 3,
                    onTap: () => _onTabTapped(3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
