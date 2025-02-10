
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';


// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   List<Widget> _buildScreens() {
//     return [
     
//       // const SettingView(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       _buildNavBarItem(Icons.home, "الرئيسية"),
    
    
//       _buildNavBarItem(Icons.favorite, "المفضلة"),
//       _buildNavBarItem(Icons.settings, "الإعدادات"),
//     ];
//   }

//   PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String title) {
//     return PersistentBottomNavBarItem(
//       icon: Icon(icon),
//       title: title,
//       activeColorPrimary: AppColors.orange,
//       inactiveColorPrimary: AppColors.darkGrey,
//       textStyle: context.textTheme.bodySmall,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         padding: const NavBarPadding.all(5),
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.ease,
//         ),
//         backgroundColor: AppColors.white,
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         decoration: const NavBarDecoration(
//           borderRadius: BorderRadius.zero,
//           colorBehindNavBar: AppColors.white,
//         ),
//         navBarHeight: kBottomNavigationBarHeight,
//         navBarStyle: isStudent ? NavBarStyle.style15 : NavBarStyle.simple);
//   }
// }
