import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scan_canser_detection/controllers/call/call_cubit.dart';
import 'package:scan_canser_detection/controllers/detiction/detiction_cubit.dart';
import 'package:scan_canser_detection/controllers/diagnosis/diagnosis_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:scan_canser_detection/data/models/diagnosis_model.dart';
import 'package:scan_canser_detection/data/servies/detication_rebo.dart';
import 'package:scan_canser_detection/data/servies/diadnosos_repository_impl.dart';
import 'package:scan_canser_detection/data/servies/is_skinImage.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDetectionView extends StatefulWidget {
  final File image;

  const InfoDetectionView({super.key, required this.image});

  @override
  State<InfoDetectionView> createState() => _InfoDetectionViewState();
}

class _InfoDetectionViewState extends State<InfoDetectionView> {
  DiagnosisModel? diagnosis;
  @override
  void initState() {
    super.initState();
    _checkIfSkinImage(widget.image);
  }

  Future<void> _checkIfSkinImage(File file) async {
    final valid = await isSkinImage(file);
    if (valid) {
      context.read<DiagnosisCubit>().analyzeImage(file);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Invalid Image"),
          content: const Text(
              "This doesn't appear to be a skin image. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiagnosisCubit, DiagnosisState>(
      listener: (context, state) {
        if (state is DiagnosisSuccess) {
          diagnosis = state.diagnosis;

          context.read<DetictionCubit>().insertDetection(
                model: DetectionModel(
                  image: widget.image,
                  name: diagnosis?.primaryDiagnosis ?? "",
                  malignancyStatus: diagnosis!.malignancyStatus,
                  description: diagnosis!.medicalRecommendation,
                  probability:
                      "${diagnosis!.confidenceLevel.toStringAsFixed(2)}%",
                ),
              );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is DiagnosisLoading,
          progressIndicator: Lottie.asset(AppAssets.loding, height: 150),
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Detection Result"),
              centerTitle: true,
            ),
            body: state is DiagnosisError
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/json/error.json", height: 150.h),
                          SizedBox(height: 20.h),
                          Text(
                            "Error: ${state.message}",
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: Colors.red,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              widget.image,
                              width: double.infinity,
                              height: 250.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          if (diagnosis != null) ...[
                            Text(
                              diagnosis!.primaryDiagnosis ?? '',
                              style: context.textTheme.headlineSmall!.copyWith(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              diagnosis!.malignancyStatus,
                              style: context.textTheme.bodyLarge!.copyWith(
                                color: Colors.deepOrange,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Confidence Level: ${diagnosis!.confidenceLevel.toStringAsFixed(2)}%",
                              style: context.textTheme.bodyLarge!.copyWith(
                                color: Colors.black87,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            if (diagnosis!.medicalRecommendation.isNotEmpty)
                              Text(
                                diagnosis!.medicalRecommendation,
                                textAlign: TextAlign.justify,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.grey[800],
                                ),
                              ),
                            SizedBox(height: 20.h),
                            if (diagnosis!.detailedProbabilities.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Detailed Probabilities:",
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  ...diagnosis!.detailedProbabilities.entries
                                      .map(
                                    (e) => Text(
                                      "- ${e.key}: ${e.value.toStringAsFixed(2)}%",
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final url =
                                        Uri.parse('https://www.vezeeta.com/en');
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
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<CallCubit>().whatsApp(
                                          phoneNumber: "01225796476",
                                          massege:
                                              "Hello, I have a detection result:\n\n"
                                              "Cancer Type: ${diagnosis!.primaryDiagnosis}\n"
                                              "Malignancy: ${diagnosis!.malignancyStatus}\n"
                                              "Confidence Level: ${diagnosis!.confidenceLevel.toStringAsFixed(2)}%\n"
                                              "Action: ${diagnosis!.medicalRecommendation}",
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
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
