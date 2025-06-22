import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';

class UserManualView extends StatelessWidget {
  const UserManualView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Column(
            crossAxisAlignment:
                isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context).translate('user_manual'),
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
                AppLocalizations.of(context).translate('application_purpose') +
                    ':',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
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
                    crossAxisAlignment: isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('app_purpose_description'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                AppLocalizations.of(context).translate('how_to_capture') + ':',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
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
                    crossAxisAlignment: isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('ensure_lighting'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        AppLocalizations.of(context).translate('avoid_blurry'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        AppLocalizations.of(context)
                            .translate('center_affected_area'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                AppLocalizations.of(context).translate('tips_best_results') +
                    ':',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
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
                    crossAxisAlignment: isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('remove_creams'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        AppLocalizations.of(context).translate('steady_camera'),
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  children: [
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
