import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_canser_detection/controllers/call/call_cubit.dart';
import 'package:scan_canser_detection/controllers/detiction/detiction_cubit.dart';
import 'package:scan_canser_detection/controllers/diagnosis/diagnosis_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:scan_canser_detection/data/models/diagnosis_model.dart';
import 'package:scan_canser_detection/data/servies/detication_rebo.dart';
import 'package:scan_canser_detection/data/servies/diadnosos_repository_impl.dart';
import 'package:scan_canser_detection/presentation/widgets/generate_and_save_pdf.dart';

class InfoDetectionView extends StatelessWidget {
  final File image;

  const InfoDetectionView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DiagnosisCubit(
            repository: DiagnosisRepositoryImpl(dio: Dio()),
          )..analyzeImage(image),
        ),
        BlocProvider(
          create: (_) => DetictionCubit(DetectionService()),
        ),
      ],
      child: BlocConsumer<DiagnosisCubit, DiagnosisState>(
        listener: (context, state) {
          if (state is DiagnosisError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is DiagnosisLoading) {
            return Scaffold(
              body: Center(child: Lottie.asset(AppAssets.loding, height: 150)),
            );
          }

          if (state is DiagnosisSuccess) {
            DiagnosisModel diagnosis = state.diagnosis;
            //
            context.read<DetictionCubit>().insertDetection(
                model: DetectionModel(
                    image: image,
                    name: diagnosis.primaryDiagnosis,
                    malignancyStatus: diagnosis.malignancyStatus,
                    description: diagnosis.actionRequired,
                    probability: diagnosis.confidenceLevel));

            return Scaffold(
              appBar: AppBar(
                title: const Text("Detection Result"),
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.all(16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          image,
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // 🧬 اسم السرطان
                      Text(
                        diagnosis.primaryDiagnosis,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // ⚠️ درجة الخطورة
                      Text(
                        diagnosis.malignancyStatus,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: Colors.deepOrange,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // 📊 نسبة التأكد
                      Text(
                        "Confidence Level: ${diagnosis.confidenceLevel}",
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // 📝 الإجراء المطلوب
                      Text(
                        diagnosis.actionRequired,
                        textAlign: TextAlign.justify,
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
                          //       cancerName: diagnosis.primaryDiagnosis,
                          //       probability: double.tryParse(diagnosis
                          //               .confidenceLevel
                          //               .replaceAll('%', '')) ??
                          //           0.0,
                          //       description: diagnosis.actionRequired,
                          //       imagePath: image.path,
                          //     );
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text("تم حفظ الملف PDF بنجاح")),
                          //     );
                          //   },
                          //   icon: const Icon(Icons.picture_as_pdf),
                          //   label: const Text("Download PDF"),
                          // ),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.read<CallCubit>().whatsApp(
                                    phoneNumber: "01225796476",
                                    massege:
                                        "Hello, I have a detection result:\n\n"
                                        "Cancer Type: ${diagnosis.primaryDiagnosis}\n"
                                        "Malignancy: ${diagnosis.malignancyStatus}\n"
                                        "Confidence Level: ${diagnosis.confidenceLevel}\n"
                                        "Action: ${diagnosis.actionRequired}",
                                  );
                            },
                            icon: const Icon(Icons.share),
                            label: const Text("Send to Doctor"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Scaffold(
            body: Center(child: Text("No Data")),
          );
        },
      ),
    );
  }
}
