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
import 'widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final tonePlayer = TonePlayer()
  ..prepare(0)
  ..prepare(1);

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
          title: const Text("SPH Tone Player Example"),
          bottom: TabBar(
            tabs: const [
              Tab(icon: MyTextH2("Info")),
              Tab(icon: MyTextH2("Seperate")),
              Tab(icon: MyTextH2("Offset")),
            ],
            onTap: (_) {
              tonePlayer
                ..stop(0)
                ..stop(1);
            },
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
