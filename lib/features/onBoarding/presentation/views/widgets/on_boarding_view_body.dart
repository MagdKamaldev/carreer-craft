import 'package:career_craft/colors.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/assets.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size.height * 0.09,
              width: size.width * 0.2,
              child: SvgPicture.asset(AppAssets.logo)),
          Center(
            child: Text(
              'Career Craft',
              style: theme.headlineMedium,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingData[index]['text']!,
                      style:
                          theme.titleMedium!.copyWith(color: primary.shade600),
                      textAlign: TextAlign.center,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Lottie.asset(
                          onBoardingData[index]['image']!,
                          height: size.height * 0.3,
                          width: size.width * 0.8,
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingData.length,
              (index) => buildDot(index: index, color: primary),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: SizedBox(
              height: 56,
              width: size.width * 0.85,
              child: Row(
                children: [
                  defaultButton(
                      function: () {
                        GoRouter.of(context).push(AppRouter.entranceView);
                      },
                      context: context,
                      text: "Sign in",
                      width: size.width * 0.85),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                height: 1,
                width: size.width * 0.296,
                color: primary.shade600,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "Or better yet...",
                style: theme.bodyMedium!.copyWith(color: primary.shade600),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                height: 1,
                width: size.width * 0.296,
                color: primary.shade600,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            height: size.height * 0.06,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.33,
                ),
                SvgPicture.asset("assets/images/facebook.svg"),
                SizedBox(
                  width: size.width * 0.1,
                ),
                SvgPicture.asset("assets/images/google.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }

  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, dynamic>> onBoardingData = [
    {
      'text': 'Feeling overwhelmed by the job market?',
      'image': 'assets/animations/1.json',
    },
    {
      'text': 'Your career\'s next step isn\'t that far.',
      'image': 'assets/animations/2.json',
    },
    {
      'text': 'Join a big community of employees and employers.',
      'image': 'assets/animations/3.json',
    },
  ];

  Widget buildDot({required int index, required Color color}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 35 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? color : color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
