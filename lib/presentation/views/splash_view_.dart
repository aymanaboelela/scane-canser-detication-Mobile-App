import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/app_cach_data.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});
  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: .2, end: 1).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    _animationController?.repeat(reverse: true);
    _goToNewScreen();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  final bool _hasSeenOnboarding =
      CacheData.getData(key: AppCacheData.isOnBordingFinshed) ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation!,
            builder: (context, _) => Opacity(
              opacity: _animation?.value,
              child: Center(
                child: Image.asset(AppAssets.logo),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToNewScreen() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        final session = Supabase.instance.client.auth.currentSession;
        if (_hasSeenOnboarding == false) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
        }
        if (session != null) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        }
      },
    );
  }
}
