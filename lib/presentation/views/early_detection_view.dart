import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';

class EarlyDetectionView extends StatelessWidget {
  const EarlyDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Early Detection: Your Best Defense Against Skin Cancer',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 105, 105, 105)),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'Understanding Skin Cancer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: font),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Skin cancer occurs when skin cells grow uncontrollably due to DNA damage, often caused by ultraviolet (UV) radiation from the sun or tanning beds. There are three main types of skin cancer:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Basal Cell Carcinoma (BCC):',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '• The most common type of skin cancer.\n'
                        '• Often appears as a shiny bump, red patch, or sore that doesn’t heal.\n'
                        '• Rarely spreads but can cause significant local damage if untreated.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. Squamous Cell Carcinoma (SCC):',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '• The second most common type.\n'
                        '• Typically appears as a scaly patch, wart-like growth, or sore that bleeds or crusts.\n'
                        '• Can spread if not treated promptly.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '3. Melanoma:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '• The most dangerous type.\n'
                        '• Develops from melanocytes (pigment-producing cells) and often looks like a mole that changes in size, shape, or color.\n'
                        '• Early detection is vital for effective treatment.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'Recognizing Warning Signs',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: font),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Skin cancer can be spotted early if you know what to look for. The ABCDE rule is a helpful guide for identifying suspicious spots or moles on the skin that might indicate skin cancer:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Center(
                child: Text(
                  'Understanding Skin Cancer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: font),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Skin cancer occurs when skin cells grow uncontrollably due to DNA damage, often caused by ultraviolet (UV) radiation from the sun or tanning beds. There are three main types of skin cancer:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A - Asymmetry:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'One half of the spot does not match the other.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'B - Border:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'The edges are irregular, scalloped, or poorly defined.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'C - Color:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Varies from one area to another, with shades of brown, black, red, white, or blue.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'D - Diameter:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Larger than 6mm (about the size of a pencil eraser), though skin cancers can be smaller.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'E - Evolving:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Changes in size, shape, or color over time.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                  "Other warning signs include sores that don’t heal, growths that increase in size, or areas of skin that itch, bleed, or become crusty. These signs are not limited to melanoma but can apply to other types of skin cancer, such as basal cell carcinoma and squamous cell carcinoma. It's important to stay vigilant and consult a healthcare professional if you notice any unusual changes in your skin."),
              Text(
                'Preventing Skin Cancer',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: font),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'While not all cases are preventable, there are steps you can take to reduce your risk:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Use Sunscreen:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Apply broad-spectrum sunscreen with at least SPF 30 daily, even on cloudy days.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. Avoid Tanning Beds:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Artificial UV light can significantly increase your risk of skin cancer.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '3. Wear Protective Clothing:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Hats, sunglasses, and long-sleeved clothing can shield your skin.',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '4. Stay in the Shade:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Especially during peak UV hours (10 AM to 4 PM).',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '5. Perform Regular Skin Checks:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Examine your skin monthly for any changes or new growths.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Importance of Regular Skin Checks',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: font),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                  "Early detection is your best defense. Schedule yearly skin exams with a dermatologist, especially if you have risk factors like fair skin, a history of sunburns, a family history of skin cancer, or a high number of moles."),
              SizedBox(
                height: 20,
              )
            ],
          ).withSymmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
