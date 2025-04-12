import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/controllers/call/call_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/presentation/widgets/generate_and_save_pdf.dart';

class InfoDetectionView extends StatelessWidget {
  const InfoDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final String cancerName = "Basal Cell Carcinoma";
    final double probability = 87.5;
    final String description =
        "Basal cell carcinoma is a type of skin cancer. It is usually caused by long-term exposure to ultraviolet (UV) radiation from sunlight.";

    final image = AssetImage(
        AppAssets.detection1); // أو NetworkImage أو FileImage حسب حالتك

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
              // 🖼️ الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image(
                  image: image,
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
    
              // 🧬 اسم السرطان
              Text(
                cancerName,
                style: context.textTheme.headlineSmall!.copyWith(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
    
              // 📊 النسبة
              Text(
                "Probability: ${probability.toStringAsFixed(1)}%",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: Colors.black87,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 16.h),
    
              // 📝 الوصف
              Text(
                description,
                textAlign: TextAlign.justify,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 30.h),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await generateAndSavePDF(
                        cancerName: "Basal Cell Carcinoma",
                        probability: 87.5,
                        description:
                            "This is a test description for the cancer type.",
                        imagePath: AppAssets
                            .detection1, // Replace with your image path
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("تم حفظ الملف PDF بنجاح")),
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text("Download PDF"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<CallCubit>().whatsApp(
                        phoneNumber: "01225796476",
                        massege: 
                            "Hello, I have a detection result for you:\n\n"
                            "Cancer Type: $cancerName\n"
                            "Probability: ${probability.toStringAsFixed(1)}%\n"
                            "Description: $description",
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
}
