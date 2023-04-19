import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/routes/app_pages.dart';

class GameShowCardAnimation extends StatelessWidget {
  const GameShowCardAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox.expand(),
        Positioned.fill(child: DataLoader.imageMainGachaBG),
        Positioned(
            child: TextButton(
          child: const Text("back"),
          onPressed: () {
            Get.offAllNamed(
              Routes.gameMain,
            );
            // Get.back(closeOverlays: true);
          },
        )),
      ],
    );
  }
}
