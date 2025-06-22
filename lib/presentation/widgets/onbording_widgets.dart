import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/app_cach_data.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';

import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigate to the next screen after onboarding
    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
    CacheData.setData(key: AppCacheData.isOnBordingFinshed, value: true);
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true, // Allow manual scrolling
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      globalFooter: const SizedBox(
        height: 10,
      ),
      pages: [
        PageViewModel(
          title: isArabic
              ? "كشف السرطان باستخدام الصور"
              : "Cancer Detection Using Images",
          body: isArabic
              ? "نستخدم الذكاء الاصطناعي لتحليل الصور وتحديد ما إذا كانت تشير إلى وجود خلايا سرطانية."
              : "We use AI to analyze images and determine whether they indicate the presence of cancerous cells.",
          image: Lottie.asset(AppAssets.onbording1, height: 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:
              isArabic ? "تحديد نوع السرطان" : "Determine the Type of Cancer",
          body: isArabic
              ? "نساعدك في تحديد ما إذا كان السرطان حميدًا أو خبيثًا، وإذا كان خبيثًا، فإننا نحدد نوعه بدقة."
              : "We help you determine whether the cancer is benign or malignant, and if malignant, we accurately determine its type.",
          image: Image.asset(AppAssets.logo),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: isArabic ? "مشاركة التقرير" : "Share the Report",
          body: isArabic
              ? "بعد تحليل الصورة، يمكنك مشاركة التقرير مع طبيبك أو مع مقدمي الرعاية الصحية الآخرين للحصول على استشارة إضافية."
              : "After analyzing the image, you can share the report with your doctor or other healthcare providers for further consultation.",
          image: Lottie.asset(AppAssets.onbording3, height: 300),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      animationDuration:
          800, // Adjust animation duration (in milliseconds) for smoother transition
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton:
          false, // Hide the back button if you don't want to show it
      skip: Text(isArabic ? 'تخطي' : 'Skip',
          style: const TextStyle(fontWeight: FontWeight.w600)),
      next: Icon(isArabic ? Icons.arrow_back : Icons.arrow_forward),
      done: Text(isArabic ? 'تم' : 'Done',
          style: const TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.easeInOut, // Smooth transition with easeInOut curve
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
