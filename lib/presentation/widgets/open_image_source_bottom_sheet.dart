import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:scan_canser_detection/data/use_cases/pickImage_use_case.dart';

void openImageSourceBottomSheet(
  BuildContext context,
  // Function(ImageUploadData) onImagePicked,
) {
  final imagePicker = PickImageUseCase();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera, color: AppColors.primaryColor),
              title: Builder(builder: (context) {
                final isArabic =
                    context.watch<LanguageCubit>().state.languageCode == 'ar';
                return Text(isArabic ? "التقاط صورة" : "Take a Photo");
              }),
              onTap: () async {
                final data = await imagePicker.pickImageFromCamera();
                Navigator.pop(context);

                if (data?.file != null) {
                  GoRouter.of(context).push(
                    AppRouter.kInfoDitectionView,
                    extra: data!.file,
                  );
                } else {
                  return;
                }

                // if (data != null) onImagePicked(data);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.photo_album, color: AppColors.primaryColor),
              title: Builder(builder: (context) {
                final isArabic =
                    context.watch<LanguageCubit>().state.languageCode == 'ar';
                return Text(
                    isArabic ? "اختيار من المعرض" : "Choose from Gallery");
              }),
              onTap: () async {
                final data = await imagePicker.pickImageFromGallery();
                Navigator.pop(context);
                if (data?.file == null) {
                  return;
                } else {
                  GoRouter.of(context).push(
                    AppRouter.kInfoDitectionView,
                    extra: data!.file,
                  );
                }
              },
            ),
          ],
        ),
      );
    },
  );
}
