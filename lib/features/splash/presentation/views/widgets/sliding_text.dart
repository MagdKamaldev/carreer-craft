import 'package:career_craft/generated/l10n.dart';
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
          S.of(context).slogan,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
