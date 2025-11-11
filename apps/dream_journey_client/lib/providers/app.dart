import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app.g.dart';

enum AppState { mainMenu }

@riverpod
class App extends _$App {
  @override
  AppState build() {
    return AppState.mainMenu;
  }
}
