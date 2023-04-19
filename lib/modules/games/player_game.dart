import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hs_gacha/modules/games/card_component_animation.dart';

class PlayerGame extends FlameGame {
  List<Sprite> sprite_golds = [];
  List<Sprite> sprite2_golds = [];
  List<Sprite> sprite_purples = [];
  List<Sprite> sprite2_purples = [];

  Sprite? cardBox;
  Sprite? sprite_blue;
  List<SpriteAnimationComponent> players = [];
  List<CardComponentAnimation> listConponent = [];
  List<Vector2> listPositon = [];

  Vector2 sizeCardGoldEffect = Vector2(253 * 0.6, 1080 * 0.6);
  Vector2 sizeCardGoldEffect2 = Vector2(148 * 0.6, 1080 * 0.6);

  Vector2 sizeCardPutpleEffect = Vector2(253 * 0.6, 1080 * 0.6);
  Vector2 sizeCardPutple2Effect = Vector2(253 * 0.6, 1080 * 0.6);

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  FutureOr<void> onLoad() async {
    for (var i = 1; i <= 10; i++) {
      sprite_golds.add(await Sprite.load(
          'box/gold/gold_${i.toString().padLeft(2).replaceAll(' ', '0')}.png'));
    }

    for (var i = 1; i <= 10; i++) {
      sprite2_golds.add(await Sprite.load(
          'box/gold/gold_2_${i.toString().padLeft(2).replaceAll(' ', '0')}.png'));
    }

    for (var i = 1; i <= 10; i++) {
      sprite_purples.add(await Sprite.load(
          'box/purple/purple_${i.toString().padLeft(2).replaceAll(' ', '0')}.png'));
    }

    for (var i = 1; i <= 10; i++) {
      sprite2_purples.add(await Sprite.load(
          'box/purple/purple_2_${i.toString().padLeft(2).replaceAll(' ', '0')}.png'));
    }

    cardBox = await Sprite.load('box/ui_box.png');

    sprite_blue = await Sprite.load('box/blue/blue_01.png');

    super.onLoad();

    var rng = Random();
    for (var i = 0; i < 10; i++) {
      listConponent.add(CardComponentAnimation(0));
    }

    for (var i = 9; i >= 0; i--) {
      add(listConponent[i]);
    }
  }

  @override
  void onRemove() {
    for (var player in players) {
      player.onRemove();
    }
    sprite_golds = [];
    super.onRemove();
  }
}
