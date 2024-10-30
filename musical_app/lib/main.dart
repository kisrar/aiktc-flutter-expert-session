import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main(List<String> args) {
  runApp(const MusicalApp());
}

class MusicalApp extends StatelessWidget {
  const MusicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Color get _randomColor {
    final random = Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (int i = 0; i < 7; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final player = AudioPlayer();
                    await player.setAsset('assets/note${i + 1}.wav');
                    player.play();
                  },
                  child: Container(
                    color: _randomColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
