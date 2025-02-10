import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.ontap,
    required this.text,
    this.color,
    this.hasBorders = false, // بارامتر الحواف الافتراضي
    this.textColor = Colors.white, // لون النص الافتراضي
  });

  final void Function()? ontap; // دالة عند الضغط
  final String text; // النص داخل الزر
  final Color? color; // لون الخلفية
  final bool hasBorders; // التحكم في الحواف
  final Color textColor; // لون النص

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.black, // لون الزر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45), // شكل الزر
          side: hasBorders
              ? const BorderSide(
                  color: AppColors.orange, width: 1) // حواف برتقالية
              : BorderSide.none, // بدون حواف
        ),
      ),
      onPressed: ontap, // تنفيذ الدالة عند الضغط
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor, // لون النص
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
