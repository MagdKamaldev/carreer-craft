import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final int bigRadius;
  final int radius;
  const ProfilePicture(
      {super.key, required this.radius, required this.bigRadius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: bigRadius.toDouble(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: CircleAvatar(
        radius: radius.toDouble(),
        backgroundImage: const AssetImage("assets/images/profile.png"),
      ),
    );
  }
}
