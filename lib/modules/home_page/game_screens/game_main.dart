import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/modules/home_page/controllers/home_controller.dart';

class GameMainScreen extends GetView<HomeController> {
  const GameMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(),
          Positioned.fill(child: DataLoader.imageMainBG),
          // Positioned.fill(
          //     child: VideoPlayerComponent(
          //   controller: DataLoader.listVideoEffect[1].videoController,
          // )),
          Positioned.fill(
              child: Container(
            color: Colors.black12,
          )),
          Positioned(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: controller.listButtonGachaHeader,
          )),
          Positioned(
            top: 15,
            left: 35,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/ui/icon.png',
                  scale: 1.3,
                ),
                const Text("Cầu nguyện")
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/sparkling-steps.png',
                scale: 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 35,
            child: Row(children: [
              controller.buttonWishOne.value!,
              const SizedBox(width: 15),
              controller.buttonWishMany.value!
            ]),
          ),
        ],
      ),
    );
  }
}
