import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/presentation/views/help_view.dart';
import 'package:scan_canser_detection/presentation/views/history_view.dart';
import 'package:scan_canser_detection/presentation/views/home_view_body.dart';
import 'package:scan_canser_detection/presentation/views/setteing_view.dart';
import 'package:scan_canser_detection/presentation/widgets/open_image_source_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // إعادة ترتيب الشاشات لتجنب التكرار
  List<Widget> _buildScreens() {
    return [
      const HomeViewBody(),
      const HelpView(),
      const SettingsView(),
      const HistoryView(),
      const SettingsView(),
    ];
  }

  // إنشاء العناصر الخاصة بشريط التنقل السفلي
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavBarItem(
          Icons.home,
          context.watch<LanguageCubit>().state.languageCode == 'ar'
              ? "الرئيسية"
              : "Home"),
      _buildNavBarItem(
          Icons.health_and_safety,
          context.watch<LanguageCubit>().state.languageCode == 'ar'
              ? "المساعدة"
              : "Help"),
      PersistentBottomNavBarItem(
        onPressed: (_) => openImageSourceBottomSheet(context),
        icon: Container(
          child: Icon(Icons.camera_alt_outlined,
              color: const Color.fromRGBO(255, 255, 255, 1), size: 30.r),
        ),
        title: (context.watch<LanguageCubit>().state.languageCode == 'ar'
            ? "اضافة صورة"
            : "Add Image"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.darkGrey,
        textStyle: context.textTheme.bodySmall?.copyWith(
          fontSize: 10.sp,
        ),
      ),
      _buildNavBarItem(
          Icons.history,
          context.watch<LanguageCubit>().state.languageCode == 'ar'
              ? "السجلات"
              : "History"),
      _buildNavBarItem(
          Icons.settings,
          context.watch<LanguageCubit>().state.languageCode == 'ar'
              ? "الاعدادات"
              : "Setting"),
    ];
  }

  // بناء عنصر في شريط التنقل السفلي
  PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String title) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: title,
      activeColorPrimary: AppColors.orange,
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
          duration: Duration(milliseconds: 300), // زيادة المدة لتقليل السرعة
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300), // تقليل السرعة لرسوم الانتقال
          curve: Curves.easeInOut,
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
