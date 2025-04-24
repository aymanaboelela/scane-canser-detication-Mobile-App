import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.detectionModel,
    this.onDismissed,
  });

  final DetectionModel detectionModel;
  final VoidCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(detectionModel.id ?? detectionModel.name),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kInfoDitectionHistoryView, extra: detectionModel);
        },
        child: Container(
          margin: EdgeInsets.all(8),
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detectionModel.name),
                    SizedBox(height: 5.h),
                    Text(
                      detectionModel.probability,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        detectionModel.description,
                        maxLines: 2,
                        style: TextStyle(color: AppColors.primaryColor),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.network(
                  detectionModel.imagePath ?? '',
                  width: 170.w,
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
                      Icon(Icons.broken_image), // في حالة وجود خطأ في التحميل
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
