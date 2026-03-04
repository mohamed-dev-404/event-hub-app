import 'package:event_hub_app/core/models/event_model.dart';
import 'package:event_hub_app/core/utils/colors/app_colors.dart';
import 'package:event_hub_app/core/utils/styles/text_styles.dart';
import 'package:event_hub_app/core/widgets/main_button.dart';
import 'package:event_hub_app/features/event_details/data/invite_friends_mock.dart';
import 'package:event_hub_app/features/event_details/models/invite_friend_model.dart';
import 'package:flutter/material.dart';

class InviteFriendsView extends StatefulWidget {
  final EventModel event;

  const InviteFriendsView({super.key, required this.event});

  static Future<void> show(BuildContext context, EventModel event) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InviteFriendsView(event: event),
    );
  }

  @override
  State<InviteFriendsView> createState() => _InviteFriendsViewState();
}

class _InviteFriendsViewState extends State<InviteFriendsView> {
  late List<InviteFriendModel> _friends;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _friends = List<InviteFriendModel>.from(inviteFriendsMock);
  }

  @override
  Widget build(BuildContext context) {
    final filteredFriends = _friends
        .where((friend) => friend.name.toLowerCase().contains(_query))
        .toList();

    return SafeArea(
      top: false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.88,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          child: Material(
            color: AppColors.white,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.strokGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Invite Friend',
                        style: AppStyles.h4.copyWith(color: AppColors.title),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
  onChanged: (value) {
    setState(() {
      _query = value.trim().toLowerCase();
    });
  },
  decoration: InputDecoration(
    hintText: 'Search',
    hintStyle: AppStyles.subTitle1Medium13.copyWith(
      color: AppColors.haifGray,
    ),

    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16,
    ),

    suffixIcon:  const Icon(
      Icons.search_rounded,
      color:AppColors.primaryBlue ,
      size: 20,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: AppColors.strokGray,
        width: 1,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: AppColors.primaryBlue,
        width: 1.5,
      ),
    ),
  ),
),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final friend = filteredFriends[index];
                      return _InviteFriendTile(
                        friend: friend,
                        onTap: () => _toggle(friend),
                      );
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemCount: filteredFriends.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: MainButton(
                    text: 'INVITE',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggle(InviteFriendModel friend) {
    final index = _friends.indexWhere((item) => item.name == friend.name);
    if (index == -1) {
      return;
    }

    setState(() {
      _friends[index] = _friends[index].copyWith(
        isSelected: !_friends[index].isSelected,
      );
    });
  }
}

class _InviteFriendTile extends StatelessWidget {
  final InviteFriendModel friend;
  final VoidCallback onTap;

  const _InviteFriendTile({required this.friend, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(friend.avatarAsset),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(friend.name, style: AppStyles.mainBodyNormal16),
                const SizedBox(height: 2),
                Text(
                  friend.followersLabel,
                  style: AppStyles.subTitle1Medium13.copyWith(
                    color: AppColors.subColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: friend.isSelected
                  ? AppColors.primaryBlue
                  : AppColors.strokGray,
            ),
            child: friend.isSelected
                ? const Icon(Icons.check, size: 14, color: AppColors.white)
                : null,
          ),
        ],
      ),
    );
  }
}
