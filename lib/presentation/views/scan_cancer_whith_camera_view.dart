import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';

class ScanCancerWhithCameraView extends StatelessWidget {
  const ScanCancerWhithCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('detection')),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).translate('detection'),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
