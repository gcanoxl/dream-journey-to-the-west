import 'package:dream_journey_client/l10n/app_localizations.dart';
import 'package:dream_journey_client/widgets/app.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlameAudio.audioCache.loadAll([
    'bgm/bgm_main.mp3',
  ]);

  FlameAudio.bgm.play('bgm/bgm_main.mp3', volume: 0.01);

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: App(),
      ),
    ),
  );
}
