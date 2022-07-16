import 'package:flutter/material.dart';
import 'package:tone_player_package/tone_player_package.dart';
import 'home.dart';

final tonePlayer = TonePlayer();

void main() {
  runApp(const App());
  tonePlayer.init();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(_) {
    return MaterialApp(
      title: "SPH Tone Player Demo",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Home(),
    );
  }
}
