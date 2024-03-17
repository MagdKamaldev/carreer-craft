import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';

class JobLoadingItem extends StatefulWidget {
  const JobLoadingItem({
    super.key,
  });

  @override
  State<JobLoadingItem> createState() => _JobLoadingItemState();
}

class _JobLoadingItemState extends State<JobLoadingItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Opacity(
      opacity: _animation.value,
      child: SizedBox(
        width: size.width * 0.95,
        height: size.height * 0.13,
        child: Card(
          elevation: 2,
          color: primary.shade300,
        ),
      ),
    );
  }
}
