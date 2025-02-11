import 'package:flutter/material.dart';

class ScanCancerWhithCameraView extends StatelessWidget {
  const ScanCancerWhithCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Cancer Whith Camera View'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Scan Cancer Whith Camera View'),
          ],
        ),
      ),
    );
  }
}
