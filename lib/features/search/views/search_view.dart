import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/assets/app_icons.dart';
import 'package:event_hub_app/core/utils/styles/app_fonts.dart';
import 'package:event_hub_app/core/widgets/custom_svg_picture.dart';
import 'package:event_hub_app/features/search/data/mockup_data.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import '../widgets/search_event_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<EventModel> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    // Wait for the Hero animation to complete (usually 300-4500ms)
    // before popping the keyboard.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        //  check mounted
        _focusNode.requestFocus();
      }
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredResults = []; // Keep list empty as requested
      } else {
        _filteredResults = allEvents
            .where(
              (event) =>
                  event.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'Search',
        ),
      ),
      body: Column(
        children: [
          // THE HERO SEARCH FIELD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Hero(
              tag: 'search_bar_tag',
              child: Material(
                elevation: 0,
                shadowColor: Colors.black12,
                borderRadius: BorderRadius.circular(12),
                child: _buildSearchBar(),
              ),
            ),
          ),

          // RESULTS LIST
          Expanded(
            child: _filteredResults.isEmpty && _searchController.text.isNotEmpty
                ? const Center(
                    child: Text('No events found matching your search'),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: _filteredResults.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return SearchEventCard(event: _filteredResults[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      focusNode: _focusNode,
      textAlignVertical: TextAlignVertical.center,
      onChanged: _handleSearch,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontFamily:
              AppFonts.airbnbCereal, // Optional: ensures hint isn't too dark
        ),
        // --- REMOVE ALL BORDERS ---
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        // ---------------------------
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomSvgPicture(
                path: AppIcons.assetsIconsSearch,
                color: AppColors.primaryBlue,
                height: 26,
              ),
              const SizedBox(width: 8),
              Container(
                height: 30,
                width: 1,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _searchController.clear();
                  _handleSearch('');
                },
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSvgPicture(
                  path: AppIcons.assetsIconsSearchFilter,
                  width: 75,
                ),
              ),
      ),
    );
  }
}
