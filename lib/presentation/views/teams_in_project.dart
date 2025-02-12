import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/presentation/widgets/team_member_card.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      {'name': 'Ayman Abo El Ela', 'image': AppAssets.ayman},
      {'name': 'Ahmed Arfat', 'image': AppAssets.caling},
      {'name': 'Khaled Akram', 'image': AppAssets.caling},
      {'name': 'Khaled', 'image': AppAssets.caling},
      {'name': 'Abdelrahman Esam', 'image': AppAssets.esam},
      {'name': 'Abdelrahman ', 'image': AppAssets.caling},
      {'name': 'Esraa ', 'image': AppAssets.caling},
      {'name': 'yusef ', 'image': AppAssets.caling},
    ];

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: members.length,
        itemBuilder: (context, index) {
          return TeamMemberCard(
            name: members[index]['name']!,
            imagePath: members[index]['image']!,
          );
        },
      ),
    );
  }
}
