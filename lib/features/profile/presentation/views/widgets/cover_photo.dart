import 'package:career_craft/features/profile/presentation/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.28,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: size.height * 0.22,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/cover.png"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const ProfilePicture(
            radius: 62,
            bigRadius: 64,
          ),
        ],
      ),
    );
  }
}
