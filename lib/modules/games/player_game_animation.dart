import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hs_gacha/modules/games/player_game.dart';

class PlayerGameAnimation extends StatefulWidget {
  const PlayerGameAnimation({super.key});

  @override
  State<PlayerGameAnimation> createState() => _PlayerGameAnimationState();
}

class _PlayerGameAnimationState extends State<PlayerGameAnimation> {
  var game = PlayerGame();
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }

  @override
  void dispose() {
    game.onRemove();
    super.dispose();
  }
}
