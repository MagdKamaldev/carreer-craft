import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/assets.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/home/presentation/views/home_view.dart';
import 'package:career_craft/features/onBoarding/presentation/views/on_borading_view.dart';
import 'package:career_craft/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // token = "";
    token = kTokenBox.get(kTokenBoxString);
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: size.height * 0.22,
            child: SvgPicture.asset(AppAssets.logo)),
        Center(
          child: Text(
            S.of(context).appName,
            style: theme.displayMedium,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(
          context,
          token == "" || token == null
              ? const OnBoradingView()
              : const HomeView());
    });
  }

  void initSlidingAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(controller);
    controller.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }
}
