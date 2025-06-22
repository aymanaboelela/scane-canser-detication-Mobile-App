import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';

class TypesOfSkinCancerView extends StatelessWidget {
  const TypesOfSkinCancerView({super.key});
  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LanguageCubit>().state.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: FadeInUp(
            child: Column(
              crossAxisAlignment:
                  isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Text(
                  AppLocalizations.of(context)
                      .translate('types_of_skin_cancer'),
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
                  AppLocalizations.of(context).translate('types_description'),
                  textAlign:
                      context.watch<LanguageCubit>().state.languageCode == 'ar'
                          ? TextAlign.right
                          : TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'bcc_title',
                  descriptionKey: 'bcc_description',
                  image1: AppAssets.detection1,
                  image2: AppAssets.detection2,
                  image3: AppAssets.detection3,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'melanoma_title',
                  descriptionKey: 'melanoma_description',
                  image1: AppAssets.detection8,
                  image2: AppAssets.detection9,
                  image3: AppAssets.detection10,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'nevus_title',
                  descriptionKey: 'nevus_description',
                  image1: AppAssets.detection11,
                  image2: AppAssets.detection12,
                  image3: AppAssets.detection14,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'vascular_title',
                  descriptionKey: 'vascular_description',
                  image1: AppAssets.detection15,
                  image2: AppAssets.detection16,
                  image3: AppAssets.detection17,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'keratosis_title',
                  descriptionKey: 'keratosis_description',
                  image1: AppAssets.detection18,
                  image2: AppAssets.detection19,
                  image3: AppAssets.detection20,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'dermatofibroma_title',
                  descriptionKey: 'dermatofibroma_description',
                  image1: AppAssets.detection21,
                  image2: AppAssets.detection22,
                  image3: AppAssets.detection23,
                ),
                LocalizedTypesOfSkinCancerItem(
                  titleKey: 'benign_keratosis_title',
                  descriptionKey: 'benign_keratosis_description',
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

class LocalizedTypesOfSkinCancerItem extends StatelessWidget {
  const LocalizedTypesOfSkinCancerItem({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.image1,
    required this.image2,
    required this.image3,
  });
  final String titleKey, descriptionKey, image1, image2, image3;
  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LanguageCubit>().state.languageCode == 'ar';
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
        crossAxisAlignment:
            isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate(titleKey) +
                ": " +
                AppLocalizations.of(context).translate(descriptionKey),
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: font,
            ),
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
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
