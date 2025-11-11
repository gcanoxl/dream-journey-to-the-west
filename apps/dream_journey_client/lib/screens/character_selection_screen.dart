import 'package:dream_journey_client/providers/app_provider.dart';
import 'package:dream_journey_client/providers/selected_character_provider.dart';
import 'package:dream_journey_client/widgets/shared/horizontal_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelectionScreen extends ConsumerWidget {
  const CharacterSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/levels/level1/level_static_1_bg.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Spacer(),
              HorizontalMenuList(
                items: [
                  {
                    Icon(
                      Icons.arrow_left,
                      size: 100,
                      color: Colors.white,
                    ): () {
                      ref.read(appProvider.notifier).set(AppState.mainMenu);
                    },
                  },
                  ...List.generate(
                    Character.values.length,
                    (index) => {
                      Image.asset(
                        Character.values[index].selectionAssetPath,
                      ): () {
                        ref
                            .read(selectedCharacterProviderProvider.notifier)
                            .set(Character.values[index]);
                        ref
                            .read(appProvider.notifier)
                            .set(AppState.levelSelection);
                      },
                    },
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
