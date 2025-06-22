import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:scan_canser_detection/controllers/call/call_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDetectionHistoryView extends StatefulWidget {
  final DetectionModel detectionModel;

  const InfoDetectionHistoryView({
    super.key,
    required this.detectionModel,
  });

  @override
  State<InfoDetectionHistoryView> createState() =>
      _InfoDetectionHistoryViewState();
}

class _InfoDetectionHistoryViewState extends State<InfoDetectionHistoryView> {
  double? confidence;
  @override
  void initState() {
    confidence =
        double.tryParse(widget.detectionModel.probability.replaceAll('%', ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('detection_result')),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // عرض الصورة باستخدام Image.network
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  widget.detectionModel.imagePath ?? '',
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // تظهر الصورة عندما يتم تحميلها بالكامل
                    } else {
                      // دائرة تحميل أثناء تحميل الصورة
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image),
                ),
              ),
              SizedBox(height: 20.h),
              // confidence != null && confidence! < 90
              //     ? Column(
              //         children: [
              //           Text(
              //             AppLocalizations.of(context)
              //                 .translate('low_confidence_level'),
              //             style: context.textTheme.headlineSmall!.copyWith(
              //               color: Colors.redAccent,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           SizedBox(height: 8.h),
              //           Text(
              //             AppLocalizations.of(context)
              //                 .translate('unclear_image_message'),
              //             style: context.textTheme.bodyLarge!.copyWith(
              //               color: Colors.grey[800],
              //               fontSize: 16.sp,
              //             ),
              //           ),
              //         ],
              //       )
              //     :
              Column(
                children: [
                  Text(
                    widget.detectionModel.name,
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.detectionModel.malignancyStatus ?? 'N/A',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Colors.deepOrange,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    "${AppLocalizations.of(context).translate('confidence_level')}: ${widget.detectionModel.probability}",
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Colors.black87,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    widget.detectionModel.description,
                    textAlign: isArabic ? TextAlign.right : TextAlign.justify,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // أزرار PDF و WhatsApp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ElevatedButton.icon(
                      //   onPressed: () async {
                      //     await generateAndSavePDF(
                      //       cancerName: detectionModel.name,
                      //       probability: double.tryParse(
                      //               detectionModel.probability.replaceAll('%', '')) ??
                      //           0.0,
                      //       description: detectionModel.description,
                      //       imagePath: detectionModel.imagePath ?? '',
                      //     );
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(content: Text("تم حفظ الملف PDF بنجاح")),
                      //     );
                      //   },
                      //   icon: const Icon(Icons.picture_as_pdf),
                      //   label: const Text("Download PDF"),
                      //   ),                            Row(

                      if (!isArabic) // Only show this button first in English layout
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<CallCubit>().whatsApp(
                                  phoneNumber: "01225796476",
                                  massege: isArabic
                                      ? "مرحبًا، لدي نتيجة فحص:\n\n"
                                          "نوع السرطان: ${widget.detectionModel.name}\n"
                                          "الخباثة: ${widget.detectionModel.malignancyStatus}\n"
                                          "مستوى الثقة: ${widget.detectionModel.probability}\n"
                                          "التوصية: ${widget.detectionModel.description}"
                                      : "Hello, I have a detection result:\n\n"
                                          "Cancer Type: ${widget.detectionModel.name}\n"
                                          "Malignancy: ${widget.detectionModel.malignancyStatus}\n"
                                          "Confidence Level: ${widget.detectionModel.probability}\n"
                                          "Action: ${widget.detectionModel.description}",
                                );
                          },
                          icon: const Icon(Icons.share),
                          label: Text(AppLocalizations.of(context)
                              .translate('send_to_doctor')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      if (!isArabic) // Only show this spacing in English layout
                        SizedBox(width: 12.w),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final url = Uri.parse('https://www.vezeeta.com/en');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode
                                    .externalApplication); // أو LaunchMode.inAppWebView
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        icon: const Icon(Icons.person_2_outlined),
                        label: Text(AppLocalizations.of(context)
                            .translate('recommend_doctor')),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      if (isArabic) // Only show this spacing in Arabic layout
                        SizedBox(width: 12.w),
                      if (isArabic) // Only show this button second in Arabic layout
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<CallCubit>().whatsApp(
                                  phoneNumber: "01225796476",
                                  massege: isArabic
                                      ? "مرحبًا، لدي نتيجة فحص:\n\n"
                                          "نوع السرطان: ${widget.detectionModel.name}\n"
                                          "الخباثة: ${widget.detectionModel.malignancyStatus}\n"
                                          "مستوى الثقة: ${widget.detectionModel.probability}\n"
                                          "التوصية: ${widget.detectionModel.description}"
                                      : "Hello, I have a detection result:\n\n"
                                          "Cancer Type: ${widget.detectionModel.name}\n"
                                          "Malignancy: ${widget.detectionModel.malignancyStatus}\n"
                                          "Confidence Level: ${widget.detectionModel.probability}\n"
                                          "Action: ${widget.detectionModel.description}",
                                );
                          },
                          icon: const Icon(Icons.share),
                          label: Text(AppLocalizations.of(context)
                              .translate('send_to_doctor')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
