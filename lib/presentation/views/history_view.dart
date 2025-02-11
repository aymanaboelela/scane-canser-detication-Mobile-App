import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:scan_canser_detection/presentation/widgets/HistoryItem.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FadeInRight(child: HistoryItem());
        },
        itemCount: 10,
      ),
    );
  }
}
