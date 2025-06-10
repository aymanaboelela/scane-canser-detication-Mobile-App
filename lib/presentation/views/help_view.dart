import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/presentation/widgets/callBottom.dart';
import 'package:scan_canser_detection/presentation/widgets/custom_container_tips.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FadeInRight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Find medical tips and emergency contacts to support your health and safety.",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: AppColors.black),
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomContainerTips(
                    title: 'Medical Tips', image: AppAssets.ight),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Protect Your Skin from the Sun:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text('• Use sunscreen daily with SPF 30 or higher.'),
                    Text('• Wear a hat and sunglasses when outdoors.'),
                    Text('• Avoid direct sunlight during peak hours.\n'),
                    Text(
                      'Regular Skin Checks:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text('• Examine your skin monthly in front of a mirror.'),
                    Text(
                        '• Look for unusual changes, such as dark spots or new moles.\n'),
                    Text(
                      'Wound Care:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                        '• If you notice non-healing wounds or bleeding spots, consult a doctor.'),
                  ],
                ),
                CustomContainerTips(
                    title: 'Emergency Contacts', image: AppAssets.caling),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ambulance:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(width: 10.w),
                        CallButton(
                          phoneNumber: '123',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('• 123\n'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Medical Emergency Hotline:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(width: 10.w),
                        CallButton(
                          phoneNumber: '137',
                        ),
                      ],
                    ),
                    Text(
                        '• 137 (For urgent medical consultations and hospital referrals).\n'),
                    Row(
                      children: [
                        Text(
                          'Skin Cancer Support:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(width: 10.w),
                        CallButton(
                          phoneNumber: '0223651235',
                        ),
                      ],
                    ),
                    Text(
                        '• Call the Egyptian National Cancer Institute at 02 2365 1235 for guidance and support.'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
