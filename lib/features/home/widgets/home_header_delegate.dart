import 'dart:math' as math;
import 'package:event_hub_app/core/functions/navigations.dart';
import 'package:event_hub_app/core/utils/styles/app_fonts.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/features/home/widgets/category_chip_card.dart';
import 'package:event_hub_app/features/notifications/views/notification_view.dart';
import 'package:event_hub_app/features/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/features/home/data/data_source/home_mockups.dart';

class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onMenuPressed;
  final double safeAreaTop;

  HomeHeaderDelegate({
    required this.onMenuPressed,
    required this.safeAreaTop,
  });

  @override
  double get minExtent => safeAreaTop + 100;
  @override
  double get maxExtent => safeAreaTop + 205;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // This is the current height of the sliver as it shrinks
    final currentHeight = math.max(minExtent, maxExtent - shrinkOffset);

    // Progress for fading elements (0.0 at top, 1.0 when collapsed)
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    // The purple background should stop slightly above the bottom to allow for the chip overlap
    // We clamp this at minExtent - 30 so it doesn't disappear entirely when collapsed
    final purpleHeight = math.max(minExtent - 30, currentHeight - 25);

    return SizedBox(
      height: currentHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //* --- 1. THE PURPLE BACKGROUND ---
          Container(
            height: purpleHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.customAppBarBg,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33),
              ),
            ),
          ),

          //* --- 2. TOP BAR (Menu, Location, Notification) ---
          _buildTopBar(context),

          //* --- 3. SEARCH BAR (Hero Trigger) ---
          _buildSearchBar(context, progress),

          //* --- 4. OVERLAPPING CATEGORY CHIPS ---
          _buildCategoryChipsList(),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  Widget _buildSearchBar(BuildContext context, double progress) {
    return Positioned(
      top: safeAreaTop + 85,
      left: 24,
      right: 24,
      child: Opacity(
        opacity: (1.0 - (progress * 2.0)).clamp(0.0, 1.0),
        child: Hero(
          tag: 'search_bar_tag', // ID
          child: Material(
            type: MaterialType.transparency,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchView()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const CustomSvgPicture(
                      path: AppIcons.assetsIconsSearch,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.white38,
                    ),
                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'Search...',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 21,
                          fontFamily: AppFonts.airbnbCereal,
                        ),
                      ),
                    ),
                    const CustomSvgPicture(
                      path: AppIcons.assetsIconsHomeFilter,
                      width: 75,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChipsList() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: HomeMockData.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = HomeMockData.categories[index];
            return CategoryChip(
              label: category.name,
              icon: category.iconAsset,
              color: category.color,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: safeAreaTop + 10,
      left: 24,
      right: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onMenuPressed,
            child: const CustomSvgPicture(
              path: AppIcons.assetsIconsMenu,
              height: 24,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 4),
                  Text(
                    'Current Location',
                    style: AppStyles.subTitle2.copyWith(
                      color: AppColors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.offWhite,
                    size: 24,
                  ),
                ],
              ),
              Text(
                'New York, USA',
                style: AppStyles.subTitle1Medium13.copyWith(
                  color: AppColors.offWhite,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.pushTo( NotificationView());
            },

            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const CustomSvgPicture(
                path: AppIcons.assetsIconsNotification,
                height: 23,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
