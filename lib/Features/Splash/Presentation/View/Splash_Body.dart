import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/Splash/Presentation/Widget/logo_animation.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;

  @override
  void initState() {
    super.initState();
    initSlideAnimation();
    Navigatorhome();
  }

  void Navigatorhome() async {
    await Future.delayed(Duration(seconds: 3));
    GoRouter.of(context).go(AppRouter.kHomeView);
  }

  void initSlideAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    slidinganimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LogoBookAnimated(size: SizeConfig.defaultSize! * 35),
        SizedBox(height: SizeConfig.defaultSize! * .5),
        AnimatedBuilder(
          animation: slidinganimation,
          builder: (context, _) => SlideTransition(
            position: slidinganimation,
            child: Text(
              'Read Books And Learn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.defaultSize! * 3,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dancing',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
