import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LanguageCubit>().state.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(),
      body: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Text(
                  AppLocalizations.of(context)
                      .translate('privacy_policy_title'),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('effective_date'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('introduction_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('introduction_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('info_collect_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('info_collect_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('info_use_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('info_use_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('data_security_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('data_security_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('data_sharing_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('data_sharing_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('ai_analysis_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('ai_analysis_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('user_rights_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('user_rights_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)
                      .translate('policy_changes_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('policy_changes_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).translate('contact_us_title'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('contact_us_text'),
                  style: TextStyle(fontSize: 14),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
