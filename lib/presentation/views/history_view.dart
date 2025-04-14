import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scan_canser_detection/controllers/detiction/detiction_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_assets.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:scan_canser_detection/data/servies/detication_rebo.dart';

import 'package:scan_canser_detection/presentation/widgets/HistoryItem.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<DetectionModel> hestory = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetictionCubit(DetectionService())..getDetections(),
      child: BlocConsumer<DetictionCubit, DetictionState>(
        listener: (context, state) {
          if (state is DetictionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is DetictionLoaded) {
            hestory = state.detections;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is DetictionLoading,
            progressIndicator: Lottie.asset(AppAssets.loding, height: 150),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<DetictionCubit>().getDetections();
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text("History"),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return FadeInRight(
                        child: HistoryItem(
                      onDismissed: () {
                        final id = hestory[index].id;

                        setState(() {
                          hestory.removeAt(index);
                        });

                        if (id != null) {
                          context.read<DetictionCubit>().deleteDetection(id);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Deleted")),
                        );
                      },
                      detectionModel: hestory[index],
                    ));
                  },
                  itemCount: hestory.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
