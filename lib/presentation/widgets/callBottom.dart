import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber; // الرقم اللي هتبعته من بره

  const CallButton({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    Future<void> makePhoneCall({required phoneNumber}) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return CircleAvatar(
      child: IconButton(
        icon: const Icon(Icons.call),
        onPressed: () async {
          makePhoneCall(phoneNumber: phoneNumber);
        },
      ),
    );
  }
}
