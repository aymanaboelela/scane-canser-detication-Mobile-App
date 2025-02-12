import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy for Skin Cancer Detection App',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Effective Date: February 2025',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  'Introduction:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'At Skin Cancer Detection, we value and respect your privacy. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our app, which uses AI technology to assist in skin cancer detection.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '1. Information We Collect:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We collect the following information:\n\n'
                  '- Personal information: When you create an account, we may collect your name, email address, and other contact details.\n'
                  '- Health-related information: You may upload images or provide details related to your skin health for analysis.\n'
                  '- Usage data: We collect information about how you interact with the app, including device information, IP address, and log data.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '2. How We Use Your Information:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We use the information we collect to:\n\n'
                  '- Provide personalized skin cancer detection results through our AI-based system.\n'
                  '- Improve the performance and accuracy of our app.\n'
                  '- Communicate with you regarding your account or updates to the app.\n'
                  '- Analyze app usage to enhance user experience.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '3. Data Security:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We implement various security measures to protect your personal and health-related data. All sensitive information is transmitted using encryption, and we store it securely in our systems. However, no method of data transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '4. Data Sharing:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We do not sell, trade, or rent your personal information to third parties. However, we may share data with trusted service providers who assist us in running our app, provided they agree to keep this information confidential. We may also share data when required by law or to protect the rights and safety of our users.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '5. AI-Based Analysis:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'The app uses AI to analyze images you upload for skin cancer detection. The AI model is trained using a large dataset of images, and it provides diagnostic suggestions based on patterns it recognizes. The results are for informational purposes only, and should not replace professional medical advice.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '6. User Rights:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'You have the right to:\n\n'
                  '- Access and update your personal information.\n'
                  '- Request deletion of your data, subject to certain legal restrictions.\n'
                  '- Opt-out of receiving marketing communications from us.\n'
                  '- Request a copy of the data we have collected about you.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '7. Changes to This Privacy Policy:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We reserve the right to update this Privacy Policy from time to time. Any changes will be reflected in the app and on this page. We encourage you to review this policy periodically to stay informed about how we are protecting your information.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  '8. Contact Us:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'If you have any questions or concerns about our Privacy Policy, please contact us at: support@skincancerdetection.com',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
