import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';

class TypesOfSkinCancerView extends StatelessWidget {
  const TypesOfSkinCancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: FadeInUp(
            child: Column(
              children: [
                Text(
                  'Types Of Skin Cancer',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: font,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Skin cancer is one of the most common forms of cancer, and understanding its types can help with early detection and treatment. Below are the seven types of skin cancer that this app is designed to identify."),
                SizedBox(
                  height: 20,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "1-Basal Cell Carcinoma (BCC):The most common and least dangerous type of skin cancer. It often appears as a small, shiny bump or patch of red skin.",
                  image1: AppAssets.detection1,
                  image2: AppAssets.detection2,
                  image3: AppAssets.detection3,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "2-Melanoma:The most dangerous type of skin cancer. It may develop in existing moles or as new dark, irregular spots.",
                  image1: AppAssets.detection8,
                  image2: AppAssets.detection9,
                  image3: AppAssets.detection10,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "3-Melanocytic Nevus:Commonly known as moles, these are usually benign skin growths caused by clusters of pigmented cells. While most are harmless, changes in size, shape, or color may require medical attention to rule out melanoma.",
                  image1: AppAssets.detection11,
                  image2: AppAssets.detection12,
                  image3: AppAssets.detection14,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "4-Vascular Lesion:Abnormalities of blood vessels that appear as red, purple, or blue marks on the skin. These lesions are usually benign but may require treatment for cosmetic reasons or if they cause symptoms.",
                  image1: AppAssets.detection15,
                  image2: AppAssets.detection16,
                  image3: AppAssets.detection17,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "5-Actinic Keratosis:A precancerous condition caused by sun damage, appearing as rough, scaly patches on exposed skin.",
                  image1: AppAssets.detection18,
                  image2: AppAssets.detection19,
                  image3: AppAssets.detection20,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "6-Dermatofibroma:A benign, firm, small skin nodule that often appears on the lower legs. It is usually painless but may feel tender when pressed. Dermatofibromas are non-cancerous and generally harmless.",
                  image1: AppAssets.detection21,
                  image2: AppAssets.detection22,
                  image3: AppAssets.detection23,
                ),
                CustomTypesOfSkinCancerItem(
                  title:
                      "7-Benign Keratosis:A non-cancerous growth that often appears as rough, raised, or warty spots on the skin. These growths are harmless and common in older adults, typically caused by sun exposure or aging.",
                  image1: AppAssets.detection24,
                  image2: AppAssets.detection25,
                  image3: AppAssets.detection16,
                ),
              ],
            ).withPadding(
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTypesOfSkinCancerItem extends StatelessWidget {
  const CustomTypesOfSkinCancerItem({
    super.key,
    required this.title,
    required this.image1,
    required this.image2,
    required this.image3,
  });
  final String title, image1, image2, image3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: font,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Image.asset(
                image1,
                height: 85.h,
                width: 100.w,
              ),
              Spacer(),
              Image.asset(
                image2,
                height: 85.h,
                width: 100.w,
              ),
              Spacer(),
              Image.asset(
                image3,
                height: 85.h,
                width: 100.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
