import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:scan_canser_detection/presentation/views/help_view.dart';
import 'package:scan_canser_detection/presentation/views/history_view.dart';
import 'package:scan_canser_detection/presentation/views/home_view_body.dart';
import 'package:scan_canser_detection/presentation/views/setteing_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeViewBody(),
      const HelpView(),
      const HomeViewBody(),
      const HistoryView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavBarItem(Icons.home, "Home"),
      _buildNavBarItem(Icons.health_and_safety, "Help"),
      PersistentBottomNavBarItem(
        onPressed: (_) => GoRouter.of(context).push(AppRouter.kScanCancer),
        icon: Container(
          child: Icon(Icons.camera_alt_outlined,
              color: AppColors.orang, size: 30.r),
        ),
        title: ("Add Image"),
        activeColorPrimary: AppColors.error.withOpacity(0.2),
        inactiveColorPrimary: AppColors.darkGrey,
        textStyle: context.textTheme.bodySmall?.copyWith(
          fontSize: 10.sp,
        ),
      ),
      _buildNavBarItem(Icons.history, "History"),
      _buildNavBarItem(Icons.settings, "Setting"),
    ];
  }

  PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String title) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: title,
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.darkGrey,
      textStyle: context.textTheme.bodySmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        padding: const NavBarPadding.all(5),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        backgroundColor: AppColors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.zero,
          colorBehindNavBar: AppColors.white,
        ),
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle.style16);
  }
}
