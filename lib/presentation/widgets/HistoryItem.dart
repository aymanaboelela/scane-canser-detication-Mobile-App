import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title of canser"),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    "description of canser the cainse is here,  ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: Image.asset(
              AppAssets.testCanser,
              width: 170.w,
            ),
          ),
        ],
      ),
    );
  }
}
