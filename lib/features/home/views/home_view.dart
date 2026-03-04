import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/features/home/data/data_source/home_mockups.dart';
import 'package:event_hub_app/features/home/widgets/custom_drawer_body.dart';
import 'package:event_hub_app/features/home/widgets/home_header_delegate.dart';
import 'package:event_hub_app/features/home/widgets/invite_friends_banner.dart';
import 'package:event_hub_app/features/home/widgets/nearby_event_card.dart';
import 'package:event_hub_app/features/home/widgets/section_title.dart';
import 'package:event_hub_app/features/home/widgets/upcoming_event_horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColors.white, // Color behind the drawer
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(45)),
      ),
      //? Your Custom Drawer Widget
      drawer: const CustomDrawerBody(),

      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            //* 1. THE COLLAPSIBLE HEADER (AppBar + Search + Categories)
            SliverPersistentHeader(
              pinned: true, // Keeps it at the top
              delegate: HomeHeaderDelegate(
                onMenuPressed: _handleMenuButtonPressed,
                safeAreaTop: MediaQuery.of(context).padding.top,
              ),
            ),

            //* 2. UPCOMING EVENTS SECTION
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SectionTitle(title: 'Upcoming Events'),
                  UpcomingEventsHorizontalList(),
                ],
              ),
            ),

            //* 3. PROMO BANNER
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: InviteFriendsBanner(),
              ),
            ),

            //* 4. NEARBY YOU TITLE
            const SliverToBoxAdapter(
              child: SectionTitle(title: 'Nearby You'),
            ),

            //* 5. THE NEARBY LIST OF EVENTS
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return NearbyEventCard(
                      event: HomeMockData.nearbyEvents[index],
                    );
                  },
                  childCount: HomeMockData.nearbyEvents.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
