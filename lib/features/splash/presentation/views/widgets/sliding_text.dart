import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: child,
        );
      },
      child: SlideTransition(
        position: slidingAnimation,
        child: Text(
          "Your Career Compass !",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
