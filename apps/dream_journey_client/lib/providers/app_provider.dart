import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

enum AppState {
  mainMenu,
  characterSelection,
  levelSelection,
  inGame,
}

@riverpod
class App extends _$App {
  @override
  AppState build() {
    return AppState.mainMenu;
  }

  set(AppState appState) {
    state = appState;
  }
}
