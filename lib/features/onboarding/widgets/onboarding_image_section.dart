import 'package:flutter/material.dart';

class OnboardingImageSection extends StatelessWidget {
  final String image;
  final int index;

  const OnboardingImageSection({
    super.key,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 0,
      right: 0,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Image.asset(
          image,
          key: ValueKey<int>(index),
          height: MediaQuery.sizeOf(context).height * .62,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
