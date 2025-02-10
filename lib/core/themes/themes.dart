import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scan_canser_detection/core/constants/colors.dart';

abstract class AppTheme {
  //!! LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.orange,
        selectionColor: AppColors.orange.withOpacity(0.3),
        selectionHandleColor: AppColors.orange,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(AppColors.orange.withOpacity(0.1)),
          foregroundColor: const WidgetStatePropertyAll(AppColors.orange),
          side: WidgetStatePropertyAll(
            BorderSide(
              width: 3,
              color: AppColors.orange.withOpacity(0.3),
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(95.w, 50.h),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(AppColors.white.withOpacity(0.2)),
          foregroundColor: const WidgetStatePropertyAll(AppColors.white),
          backgroundColor: WidgetStatePropertyAll(AppColors.darkGrey),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38), // Use 8 as default value
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(double.maxFinite, 48.h),
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(AppColors.white),
        fillColor: const WidgetStatePropertyAll(AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.dm),
        ),
        side: BorderSide(color: AppColors.darkGrey, width: 1.dm),
      ),
      //

      iconTheme: const IconThemeData(color: AppColors.orange),
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(AppColors.orange),
        thumbColor: WidgetStatePropertyAll(AppColors.white),
        trackColor: WidgetStatePropertyAll(AppColors.orange),
        thumbIcon: WidgetStatePropertyAll(Icon(
          Icons.light_mode,
          color: AppColors.white,
        )),
      ),

      useMaterial3: true,
      brightness: Brightness.light,

      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: AppColors.orange),
        elevation: 0,
        shadowColor: AppColors.black.withOpacity(0.3),
      ),

      //-----------------------------------------------------------//* TEXT
      //!-------------------------------------------------- Body Text Color => Black
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
        //!-------------------------------------------------- Display Text Color => Orange
        displayLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.orange,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          fontSize: 14.sp,
          color: AppColors.orange,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: AppColors.orange,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        //!-------------------------------------------------- Display Text Color => Black With Lemonada FontFamily
        titleLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        //--------------------------------------------------//* For button
        titleMedium: TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: AppColors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      //--------------------------------------------------//* INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 14.spMin),
        filled: true,
        fillColor: AppColors.white,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          borderSide: BorderSide(
            width: 1.7.w,
            color: AppColors.darkGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          borderSide: BorderSide(
            width: 1.7.w,
            color: AppColors.darkGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          borderSide: BorderSide(
            width: 2.w,
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          borderSide: BorderSide(
            width: 2.w,
            color: AppColors.error,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      ),
    );
  }
}
