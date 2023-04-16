// ignore_for_file: file_names
import 'dart:developer';

import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/app_config.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/models/model.dart';
import 'package:hs_gacha/cores/common/config.dart';
import 'package:hs_gacha/routes/app_pages.dart';

class HomeController extends GetxController {
  Rxn<SpriteButton> buttonWishOne = Rxn<SpriteButton>();
  Rxn<SpriteButton> buttonWishMany = Rxn<SpriteButton>();

  RxList<Widget> listButtonGachaHeader = <Widget>[].obs;

  @override
  void onInit() async {
    log('initialize GameMainController', name: AppConfig.packageName);
    await initData();
    super.onInit();
  }

  Future<void> initData() async {
    listButtonGachaHeader.clear();
    buttonWishOne.value = DataLoader.loadButton(
      'btn_wish.png',
      'btn_wish_press.png',
      355 * .65,
      88 * .68,
      () => () {},
      _btnTitleWish('SpecialWish.png', 1),
    );

    buttonWishMany.value = DataLoader.loadButton(
      'btn_wish.png',
      'btn_wish_press.png',
      355 * .65,
      88 * .68,
      () => () {
        Get.toNamed(Routes.videoEffect, arguments: [
          {'videoType': VideoEffectType.fivestarmuti}
        ]);
      },
      _btnTitleWish('SpecialWish.png', 10),
    );

    listButtonGachaHeader.add(DataLoader.loadButton(
      'buttonGacha/noelle.png',
      'buttonGacha/noelle-selected.png',
      180 * .65,
      90 * .68,
      () => () {},
      const SizedBox(),
    ));
    listButtonGachaHeader.add(const SizedBox(width: 20));

    listButtonGachaHeader.add(DataLoader.loadButton(
      'buttonGacha/klee-selected.png',
      'buttonGacha/klee-selected.png',
      180 * .65,
      90 * .68,
      () => () {},
      const SizedBox(),
    ));
    listButtonGachaHeader.add(const SizedBox(width: 20));
    listButtonGachaHeader.add(DataLoader.loadButton(
      'buttonGacha/weapon.png',
      'buttonGacha/weapon-selected.png',
      180 * .65,
      90 * .68,
      () => () {},
      const SizedBox(),
    ));
    listButtonGachaHeader.add(const SizedBox(width: 20));
    listButtonGachaHeader.add(DataLoader.loadButton(
      'buttonGacha/wanderlust.png',
      'buttonGacha/wanderlust-selected.png',
      180 * .65,
      90 * .68,
      () => () {},
      const SizedBox(),
    ));
  }

  Widget _btnTitleWish(String src, int amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Cầu Nguyện x$amount",
          style: Config.black.bodyMedium!.copyWith(color: Config.colorText1),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/$src', width: 20, height: 20),
              Text(
                " x$amount",
                style:
                    Config.black.bodyMedium!.copyWith(color: Config.colorText1),
              ),
            ]),
      ],
    );
  }
}
