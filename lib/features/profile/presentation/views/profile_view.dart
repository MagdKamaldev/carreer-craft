import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/profile/presentation/views/widgets/cover_photo.dart';
import 'package:career_craft/features/profile/presentation/views/widgets/profile_picture.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CoverPhoto(),
        SizedBox(
          height: size.height * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Magd Kamal",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    "(Flutter Developer)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "User",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                S.of(context).Bio,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: secondary,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).jobs,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      const ProfilePicture(radius: 42, bigRadius: 44),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "(Flutter Developer)",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      const ProfilePicture(radius: 42, bigRadius: 44),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "(Flutter Developer)",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      const ProfilePicture(radius: 42, bigRadius: 44),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "(Flutter Developer)",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
