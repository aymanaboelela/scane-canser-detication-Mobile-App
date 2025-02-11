import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';

class CustomContainerTips extends StatelessWidget {
  const CustomContainerTips({
    super.key,
    required this.title,
    required this.image,
  });
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          Spacer(),
          Image.asset(
            image,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
