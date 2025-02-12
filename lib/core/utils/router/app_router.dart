// import 'package:akodo_api/features/addHouse/presentation/controller/addhouse/add_house_stite.dart';

import 'package:go_router/go_router.dart';
import 'package:scan_canser_detection/core/utils/router/page_transition.dart';
import 'package:scan_canser_detection/presentation/views/create_account.dart';
import 'package:scan_canser_detection/presentation/views/early_detection_view.dart';
import 'package:scan_canser_detection/presentation/views/home_view.dart';
import 'package:scan_canser_detection/presentation/views/login_view.dart';
import 'package:scan_canser_detection/presentation/views/on_bording_view.dart';
import 'package:scan_canser_detection/presentation/views/scan_cancer_whith_camera_view.dart';
import 'package:scan_canser_detection/presentation/views/splash_view_.dart';
import 'package:scan_canser_detection/presentation/views/types_of_skin_cancer_view.dart';
import 'package:scan_canser_detection/presentation/views/user_manual_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onboardingView';
  static const kLoginView = '/login';
  static const kHomeView = '/homeview';
  static const kSignUp = '/signup';
  static const kDistanceOff = '/DistanceOff';
  static const kScanCancer = '/ScanCancer';
  static const kTypesOfSkinCancerView = '/typesOfSkinCancerView';
  static const kEarlyDetectionView = '/earlyDetectionView';
  static const kUserManualView = '/userManualView';
  // edit house

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const SplashViewbody()),
      ),
      GoRoute(
        path: kSignUp,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const SignupView()),
      ),
      GoRoute(
        path: kOnBoardingView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const OnBordingView()),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const LoginView()),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(HomeView()),
      ),
      GoRoute(
        path: kScanCancer,
        pageBuilder: (context, state) => PageTransitionManager.fadeTransition(
            const ScanCancerWhithCameraView()),
      ),
      GoRoute(
        path: kTypesOfSkinCancerView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const TypesOfSkinCancerView()),
      ),
      GoRoute(
        path: kEarlyDetectionView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const EarlyDetectionView()),
      ),
      GoRoute(
        path: kUserManualView,
        pageBuilder: (context, state) =>
            PageTransitionManager.fadeTransition(const UserManualView()),
      ),
    ],
  );
}
