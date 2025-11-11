import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_character_provider.g.dart';

enum Character {
  sunWukong(1),
  tangSeng(2),
  zhuBajie(3),
  shaSeng(4);

  final int id;
  const Character(this.id);

  String get selectionAssetPath {
    return "assets/images/character_selection/character_$id.png";
  }
}

@Riverpod(keepAlive: true)
class SelectedCharacterProvider extends _$SelectedCharacterProvider {
  @override
  Character build() {
    return Character.sunWukong;
  }

  set(Character character) {
    state = character;
  }
}
