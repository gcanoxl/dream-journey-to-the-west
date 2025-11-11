import 'package:dream_journey_client/providers/app_provider.dart';
import 'package:dream_journey_client/screens/character_selection_screen.dart';
import 'package:dream_journey_client/screens/level_selection_screen.dart';
import 'package:dream_journey_client/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    switch (state) {
      case AppState.mainMenu:
        return MainMenuScreen();
      case AppState.characterSelection:
        return CharacterSelectionScreen();
      case AppState.levelSelection:
        return LevelSelectionScreen();
    }
  }
}
