import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freebook_app/core/utils/app_router.dart';
import 'package:freebook_app/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRouter.kHomeView);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsData.logo,
            semanticsLabel: 'Logo',
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 15,
          ),
          AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return SlideTransition(
                  position: slidingAnimation,
                  child: const Text('read free books'));
            },
            animation: slidingAnimation,
          )
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
