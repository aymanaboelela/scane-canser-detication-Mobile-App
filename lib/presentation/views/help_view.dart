import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/presentation/widgets/callBottom.dart';
import 'package:scan_canser_detection/presentation/widgets/custom_container_tips.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          final isArabic =
              context.watch<LanguageCubit>().state.languageCode == 'ar';
          return Text(isArabic ? "المساعدة" : "Help");
        }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FadeInRight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return Text(
                    isArabic
                        ? "ابحث عن نصائح طبية وجهات اتصال للطوارئ لدعم صحتك وسلامتك."
                        : "Find medical tips and emergency contacts to support your health and safety.",
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: AppColors.black),
                  );
                }),
                SizedBox(
                  height: 12.h,
                ),
                Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return CustomContainerTips(
                      title: isArabic ? 'نصائح طبية' : 'Medical Tips',
                      image: AppAssets.ight);
                }),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                        isArabic
                            ? 'احمِ بشرتك من الشمس:'
                            : 'Protect Your Skin from the Sun:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      );
                    }),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(isArabic
                              ? '• استخدم واقي الشمس يوميًا بعامل حماية 30 أو أعلى.'
                              : '• Use sunscreen daily with SPF 30 or higher.'),
                          Text(isArabic
                              ? '• ارتدِ قبعة ونظارات شمسية عند الخروج.'
                              : '• Wear a hat and sunglasses when outdoors.'),
                          Text(isArabic
                              ? '• تجنب أشعة الشمس المباشرة خلال ساعات الذروة.\n'
                              : '• Avoid direct sunlight during peak hours.\n'),
                        ],
                      );
                    }),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                        isArabic
                            ? 'فحوصات الجلد المنتظمة:'
                            : 'Regular Skin Checks:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      );
                    }),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(isArabic
                              ? '• افحص بشرتك شهريًا أمام المرآة.'
                              : '• Examine your skin monthly in front of a mirror.'),
                          Text(isArabic
                              ? '• ابحث عن تغييرات غير عادية، مثل البقع الداكنة أو الشامات الجديدة.\n'
                              : '• Look for unusual changes, such as dark spots or new moles.\n'),
                        ],
                      );
                    }),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isArabic ? 'العناية بالجروح:' : 'Wound Care:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(isArabic
                              ? '• إذا لاحظت جروحًا لا تلتئم أو بقعًا نازفة، استشر الطبيب.'
                              : '• If you notice non-healing wounds or bleeding spots, consult a doctor.'),
                        ],
                      );
                    }),
                  ],
                ),
                Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return CustomContainerTips(
                      title: isArabic
                          ? 'جهات اتصال للطوارئ'
                          : 'Emergency Contacts',
                      image: AppAssets.caling);
                }),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Builder(builder: (context) {
                          final isArabic = context
                                  .watch<LanguageCubit>()
                                  .state
                                  .languageCode ==
                              'ar';
                          return Text(
                            isArabic ? 'الإسعاف:' : 'Ambulance:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          );
                        }),
                        SizedBox(width: 10.w),
                        CallButton(
                          phoneNumber: '123',
                        ),
                      ],
                    ),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                        AppLocalizations.of(context)
                            .translate('ambulance_number'),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      );
                    }),
                    Row(children: [
                      Builder(builder: (context) {
                        final isArabic =
                            context.watch<LanguageCubit>().state.languageCode ==
                                'ar';
                        return Text(
                          isArabic
                              ? 'خط الطوارئ الطبية:'
                              : 'Medical Emergency Hotline:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        );
                      }),
                    ]),
                    SizedBox(width: 10.w),
                    CallButton(
                      phoneNumber: '137',
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return Text(
                    AppLocalizations.of(context).translate('hotline_info'),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  );
                }),
                Row(
                  textDirection:
                      context.watch<LanguageCubit>().state.languageCode == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  children: [
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                        AppLocalizations.of(context)
                            .translate('skin_cancer_support'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      );
                    }),
                    SizedBox(width: 10.w),
                    CallButton(
                      phoneNumber: '0223651235',
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return Text(
                    AppLocalizations.of(context)
                        .translate('cancer_institute_info'),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
