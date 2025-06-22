import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';

class EarlyDetectionView extends StatelessWidget {
  const EarlyDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).translate('early_detection_title'),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 105, 105, 105)),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  isArabic ? 'فهم سرطان الجلد' : 'Understanding Skin Cancer',
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
                AppLocalizations.of(context).translate('skin_cancer_occurs'),
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
              SizedBox(
                height: 12,
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
                        isArabic
                            ? '1. سرطان الخلايا القاعدية:'
                            : '1. Basal Cell Carcinoma (BCC):',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? '• النوع الأكثر شيوعًا من سرطان الجلد.\n'
                                '• غالبًا ما يظهر كورم لامع، أو بقعة حمراء، أو جرح لا يلتئم.\n'
                                '• نادرًا ما ينتشر ولكنه قد يسبب ضررًا كبيرًا محليًا إذا لم يعالج.'
                            : '• The most common type of skin cancer.\n'
                                '• Often appears as a shiny bump, red patch, or sore that doesn\'t heal.\n'
                                '• Rarely spreads but can cause significant local damage if untreated.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        isArabic ? '2. الميلانوما:' : '2. Melanoma:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? '• النوع الأكثر خطورة.\n'
                                '• يتطور من الخلايا الصباغية (الخلايا المنتجة للصبغة) وغالبًا ما يبدو مثل شامة تتغير في الحجم أو الشكل أو اللون.\n'
                                '• الكشف المبكر ضروري للعلاج الفعال.'
                            : '• The most dangerous type.\n'
                                '• Develops from melanocytes (pigment-producing cells) and often looks like a mole that changes in size, shape, or color.\n'
                                '• Early detection is vital for effective treatment.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  isArabic
                      ? 'التعرف على علامات التحذير'
                      : 'Recognizing Warning Signs',
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
                'Skin cancer can be spotted early if you know what to look for. The ABCDE rule is a helpful guide for identifying suspicious spots or moles on the skin that might indicate skin cancer:',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
              Center(
                child: Text(
                  isArabic ? 'فهم سرطان الجلد' : 'Understanding Skin Cancer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: font),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context).translate('skin_cancer_occurs'),
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
              SizedBox(
                height: 12,
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
                        isArabic ? 'أ - عدم التناظر:' : 'A - Asymmetry:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? 'نصف البقعة لا يطابق النصف الآخر.'
                            : 'One half of the spot does not match the other.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic ? 'ب - الحدود:' : 'B - Border:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? 'الحواف غير منتظمة أو مسننة أو غير محددة بشكل جيد.'
                            : 'The edges are irregular, scalloped, or poorly defined.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic ? 'ج - اللون:' : 'C - Color:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? 'يختلف من منطقة إلى أخرى، بدرجات متنوعة من البني والأسود والأحمر والأبيض أو الأزرق.'
                            : 'Varies from one area to another, with shades of brown, black, red, white, or blue.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic ? 'د - القطر:' : 'D - Diameter:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? 'أكبر من 6 مم (حوالي حجم ممحاة قلم الرصاص)، على الرغم من أن سرطانات الجلد يمكن أن تكون أصغر.'
                            : 'Larger than 6mm (about the size of a pencil eraser), though skin cancers can be smaller.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic ? 'هـ - التطور:' : 'E - Evolving:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      Text(
                        isArabic
                            ? 'تغيرات في الحجم أو الشكل أو اللون بمرور الوقت.'
                            : 'Changes in size, shape, or color over time.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Image.asset("assets/images/Capture.PNG"),
              SizedBox(
                height: 12.h,
              ),
              Text(
                  "Other warning signs include sores that don’t heal, growths that increase in size, or areas of skin that itch, bleed, or become crusty. These signs are not limited to melanoma but can apply to other types of skin cancer, such as basal cell carcinoma and squamous cell carcinoma. It's important to stay vigilant and consult a healthcare professional if you notice any unusual changes in your skin."),
              Text(
                isArabic ? 'الوقاية من سرطان الجلد' : 'Preventing Skin Cancer',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: font),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                isArabic
                    ? 'على الرغم من أن جميع الحالات قد لا تكون قابلة للتجنب، إلا أنه يمكنك اتخاذ خطوات لتقليل المخاطر:'
                    : 'While not all cases are preventable, there are steps you can take to reduce your risk:',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
              SizedBox(
                height: 12,
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
                        isArabic
                            ? '1.☀ استخدم واقي الشمس:'
                            : '1.☀ Use Sunscreen:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        isArabic
                            ? 'قم بتطبيق واقي شمس واسع الطيف مع SPF 30 على الأقل يوميًا، حتى في الأيام الغائمة.'
                            : 'Apply broad-spectrum sunscreen with at least SPF 30 daily, even on cloudy days.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic
                            ? '2.🛏 تجنب أسرة التسمير:'
                            : '2.🛏 Avoid Tanning Beds:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        isArabic
                            ? 'يمكن أن تزيد الأشعة فوق البنفسجية الصناعية بشكل كبير من خطر إصابتك بسرطان الجلد.'
                            : 'Artificial UV light can significantly increase your risk of skin cancer.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic
                            ? '3.👕 ارتدِ ملابس واقية:'
                            : '3.👕 Wear Protective Clothing :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        isArabic
                            ? 'يمكن أن تحميك القبعات والنظارات الشمسية والملابس ذات الأكمام الطويلة.'
                            : 'Hats, sunglasses, and long-sleeved clothing can shield your skin.',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic
                            ? '4.🌲 ابق في الظل:'
                            : '4.🌲 Stay in the Shade:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        isArabic
                            ? 'خاصة خلال ساعات الذروة للأشعة فوق البنفسجية (10 صباحًا إلى 4 مساءً).'
                            : 'Especially during peak UV hours (10 AM to 4 PM).',
                        style: TextStyle(color: AppColors.white),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        isArabic
                            ? '5.🔎 قم بإجراء فحوصات جلدية منتظمة:'
                            : '5.🔎 Perform Regular Skin Checks:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        isArabic
                            ? 'افحص جلدك شهريًا بحثًا عن أي تغييرات أو نمو جديد.'
                            : 'Examine your skin monthly for any changes or new growths.',
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
                isArabic
                    ? 'أهمية الفحوصات الجلدية المنتظمة'
                    : 'Importance of Regular Skin Checks',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: font),
              ),
              SizedBox(
                height: 12,
              ),
              Text(isArabic
                  ? "الكشف المبكر هو أفضل وسيلة دفاع لديك. جدولة فحوصات جلدية سنوية مع طبيب الأمراض الجلدية، خاصة إذا كان لديك عوامل خطر مثل البشرة الفاتحة، تاريخ من حروق الشمس، تاريخ عائلي من سرطان الجلد، أو عدد كبير من الشامات."
                  : "Early detection is your best defense. Schedule yearly skin exams with a dermatologist, especially if you have risk factors like fair skin, a history of sunburns, a family history of skin cancer, or a high number of moles."),
              SizedBox(
                height: 20,
              )
            ],
          ).withSymmetricPadding(horizontal: 16.h),
        ),
      ),
    );
  }
}
