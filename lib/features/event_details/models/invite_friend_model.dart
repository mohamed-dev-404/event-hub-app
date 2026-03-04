class InviteFriendModel {
  final String name;
  final String followersLabel;
  final String avatarAsset;
  final bool isSelected;

  const InviteFriendModel({
    required this.name,
    required this.followersLabel,
    required this.avatarAsset,
    this.isSelected = false,
  });

  InviteFriendModel copyWith({bool? isSelected}) {
    return InviteFriendModel(
      name: name,
      followersLabel: followersLabel,
      avatarAsset: avatarAsset,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
