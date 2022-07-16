// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';
import 'package:tone_player/tone_player.dart';

import 'tabs/tab_1.dart';
import 'tabs/tab_0.dart';
import 'tabs/tab_2.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final tonePlayer = TonePlayer();

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main() {
  runApp(const App());
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class App extends StatelessWidget {
  //
  //
  //

  const App({Key? key}) : super(key: key);

  //
  //
  //

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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Home extends StatefulWidget {
  //
  //
  //

  const Home({Key? key}) : super(key: key);

  //
  //
  //

  @override
  _HomeState createState() => _HomeState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _HomeState extends State<Home> {
  //
  //
  //

  @override
  Widget build(_) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SPH Tone Player Demo"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info_outline)),
              Tab(icon: Icon(Icons.music_note_outlined)),
              Tab(icon: Icon(Icons.science_outlined)),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Tab0(),
            Tab1(),
            Tab2(),
          ],
        ),
      ),
    );
  }
}
