import 'package:dream_journey_client/l10n/app_localizations.dart';
import 'package:dream_journey_client/providers/app_provider.dart';
import 'package:dream_journey_client/widgets/shared/text_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelSelectionScreen extends ConsumerWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
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
              TextMenuList(
                items: [
                  {
                    locale.roadToTheHeaven: () {
                      ref.read(appProvider.notifier).set(AppState.inGame);
                    },
                  },
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
