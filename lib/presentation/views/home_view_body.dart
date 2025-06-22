import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
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
              child: Builder(builder: (context) {
                final isArabic =
                    context.watch<LanguageCubit>().state.languageCode == 'ar';
                return Text(
                  isArabic
                      ? "طبيبك الجلدية\nالشخصي بالذكاء الاصطناعي"
                      : "Your Personal \nAI Dermatologist",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                );
              }),
            ),
            SizedBox(
              height: 12,
            ),
            FadeInUp(
              duration: Durations.extralong2,
              child: InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.kTypesOfSkinCancerView),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final isArabic = context
                                        .watch<LanguageCubit>()
                                        .state
                                        .languageCode ==
                                    'ar';
                                return Text(
                                  isArabic
                                      ? "يمكنك العثور على أنواع سرطان الجلد المختلفة هنا."
                                      : "You can find the different types of skin cancer here.",
                                  style: context.textTheme.bodyLarge
                                      ?.copyWith(color: Colors.black),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                              width: 8.w), // لتوفير مسافة بين النص والأيقونة
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: Colors.grey[700],
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
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                          isArabic
                              ? "الكشف المبكر يحدث فرقًا"
                              : "Early Detection Makes a Difference",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold));
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return CustomContainerTips(
                          title: isArabic
                              ? "اختبارنا يساعدك\nعلى كشف سرطان الجلد"
                              : "Our Test Can Help\n You To Detect Skin Cancer",
                          image: AppAssets.fingerprint);
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Builder(builder: (context) {
                      final isArabic =
                          context.watch<LanguageCubit>().state.languageCode ==
                              'ar';
                      return Text(
                        isArabic
                            ? "اكتشاف سرطان الجلد في مرحلة مبكرة يزيد\nفرصك في الشفاء بشكل كبير. معظم الشامات\nوالبقع البنية على الجلد غير ضارة لكن ليس دائماً."
                            : "Finding skin cancer at early stage can vastly \nencrease your chances for cure. Most moles,\n brown spots growths on the skin are harmless\n but not always.",
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kEarlyDetectionView),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.lightBlueAccent.shade700,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Builder(builder: (context) {
                            final isArabic = context
                                    .watch<LanguageCubit>()
                                    .state
                                    .languageCode ==
                                'ar';
                            return Text(
                              isArabic ? "اقرأ المزيد" : "Read More",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            FadeInUp(
              child: InkWell(
                onTap: () => GoRouter.of(context).push(
                  AppRouter.kUserManualView,
                ),
                child: Builder(builder: (context) {
                  final isArabic =
                      context.watch<LanguageCubit>().state.languageCode == 'ar';
                  return CustomContainerTips(
                      title: isArabic
                          ? "الرجاء قراءة هذا الدليل\nبعناية لتجنب أي\nسوء فهم محتمل"
                          : "Please read this manual\ncarefully to prevent any\npossible misunderstanding",
                      image: AppAssets.detection);
                }),
              ),
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
