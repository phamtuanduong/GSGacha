import 'dart:async';

import 'package:flame/components.dart';
import 'package:hs_gacha/modules/games/player_game.dart';

class CardComponentAnimation extends Component with HasGameRef<PlayerGame> {
  final int type;
  CardComponentAnimation(this.type);

  late Vector2 positonDefautl;
  late SpriteAnimationComponent playerDefault;

  @override
  FutureOr<void> onLoad() async {
    List<SpriteAnimationComponent> players = gameRef.players;
    List<Vector2> listPositon = gameRef.listPositon;

    double beforePositionX = 0;

    if (listPositon.isNotEmpty) {
      beforePositionX = listPositon.last.x + players.last.size.x;
    }

    if (type == 0) {
      players.add(SpriteAnimationComponent(
        animation: SpriteAnimation.spriteList(
          listPositon.isNotEmpty ? gameRef.sprite2_golds : gameRef.sprite_golds,
          stepTime: 0.1,
        ),
        size: listPositon.isNotEmpty
            ? gameRef.sizeCardGoldEffect2
            : gameRef.sizeCardGoldEffect,
      ));

      if (listPositon.isNotEmpty) {
        players.last.position.x = beforePositionX;
      }

      listPositon.add(players.last.position);
    }
    super.onLoad();
    positonDefautl = Vector2(players.last.x, players.last.y);

    playerDefault = players.last;

    final card = SpriteComponent(
        size: Vector2(153 * 0.58, 610 * 0.6 + 1),
        sprite: gameRef.cardBox,
        position: Vector2(
            players.length > 1
                ? players.last.position.x
                : players.last.position.x + players.last.size.x / 2 - 13,
            players.last.position.y + players.last.size.y / 4.65));

    if (type != 2) {
      add(players.last);
    } else {
      add(SpriteComponent(
          size: Vector2(253 * 0.6, 1080 * 0.6),
          sprite: gameRef.sprite_blue,
          position: Vector2(
              players.last.position.x + players.last.size.x / 2 - 13,
              players.last.position.y + players.last.size.y / 4.65)));
    }
    //add(card);

    gameRef.listCardPositon.add(card.position);
  }

  void updatePos() {
    if (playerDefault.x > positonDefautl.x) {
      playerDefault.position.x -= 20;
    } else {
      playerDefault.position = positonDefautl;
    }
  }
}
