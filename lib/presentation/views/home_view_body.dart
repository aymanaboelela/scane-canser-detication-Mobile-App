import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/presentation/widgets/custom_container_tips.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeft(
              child: Text(
                "Your Personal \nAI Dermatologist",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            FadeInUp(
              duration: Durations.extralong2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlueAccent.shade700,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.lightBlueAccent.shade700,
                ),
                child: Column(
                  children: [
                    Lottie.asset(
                      AppAssets.ai,
                      height: 200,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 295.w,
                          child: Text(
                            "You can find the difference types of scin canser here .",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 28,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ).withSymmetricPadding(
                  horizontal: 12,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            FadeInUp(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlueAccent.shade700,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Early Detection Makes a Difference",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 12,
                    ),
                    CustomContainerTips(
                        title: "Our Test Can Help\n You To Detect Skin Cancer",
                        image: AppAssets.fingerprint),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Finding skin cancer at early stage can vastly \nencrease your chances for cure.Most moles,\n brown spots growths on the skin are harmless\n but not always.",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent.shade700,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Read More",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            FadeInUp(
              child: CustomContainerTips(
                  title:
                      "Please read this manual\ncarefully to prevent any\npossible misunderstanding",
                  image: AppAssets.detection),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ).withAllPadding(12),
      ),
    );
  }
}
