import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';

class UserManualView extends StatelessWidget {
  const UserManualView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "User Manual",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: font),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Application Purpose:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This application is used for skin cancer diagnosis. It identifies the seven different types of skin cancer.The application is NOT 100% accurate, so it is recommended to consult a doctor for confirmation',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'How to Capture or Upload Images:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Ensure good lighting when capturing the image.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '2. Avoid blurry or unclear images.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '3. Make sure the affected skin area is centered and clearly visible in the photo.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Tips for Best Results:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Remove any creams or makeup from the skin before taking the photo.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '2. Ensure the camera is steady while capturing the image.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Row(children: [
                Spacer(
                  flex: 2,
                ),
                Lottie.asset(AppAssets.scan, height: 250, width: 250),
                Spacer(
                  flex: 1,
                )
              ])
            ],
          ).withSymmetricPadding(horizontal: 12),
        ),
      ),
    );
  }
}
