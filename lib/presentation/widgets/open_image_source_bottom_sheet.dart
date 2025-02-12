import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';

void openImageSourceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera, color: AppColors.primaryColor),
              title: Text("Take a Photo"),
              onTap: () {
                // Add functionality for opening the camera
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album, color: AppColors.primaryColor),
              title: Text("Choose from Gallery"),
              onTap: () {
                // Add functionality for selecting from gallery
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
