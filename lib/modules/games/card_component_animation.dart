import 'dart:async';

import 'package:flame/components.dart';
import 'package:hs_gacha/modules/games/player_game.dart';

class CardComponentAnimation extends Component with HasGameRef<PlayerGame> {
  final int type;
  CardComponentAnimation(this.type);
  @override
  FutureOr<void> onLoad() {
    List<SpriteAnimationComponent> players = gameRef.players;
    List<Vector2> listPositon = gameRef.listPositon;

    if (type == 0) {
      players.add(SpriteAnimationComponent(
        animation: SpriteAnimation.spriteList(
          gameRef.sprite_golds,
          stepTime: 0.1,
        ),
        size:
            Vector2(gameRef.sizeCardGoldEffect.x, gameRef.sizeCardGoldEffect.y),
      ));
      listPositon.add(players.last.position);
      if (listPositon.isNotEmpty && listPositon.length > 1) {
        players.last.position.x = listPositon.last.x +
            listPositon[listPositon.length - 2].x +
            gameRef.sizeCardGoldEffect.x / 2 +
            12;
      }
    }
    super.onLoad();
    final player = SpriteComponent(
        size: Vector2(153 * 0.58, 610 * 0.6 + 1),
        sprite: gameRef.cardBox,
        position: Vector2(
            players.last.position.x + players.last.size.x / 2 - 13,
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
    add(player);
  }
}
