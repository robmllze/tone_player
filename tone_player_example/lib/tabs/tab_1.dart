// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';

import '/main.dart';
import '/my_tone_player/my_tone_player.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Tab1 extends StatefulWidget {
  //
  //
  //

  const Tab1({Key? key}) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<Tab1> {
  //
  //
  //

  late final _contoller0 = MyTonePlayerController(
    id: 0,
    onChangeFrequency: (final value) {
      tonePlayer.setFrequency(0, double.parse(value ?? "0.0"));
    },
    onChangeAmplitude: (final value) {
      tonePlayer.setAmplitude(0, double.parse(value ?? "0.0"));
    },
  );

  //
  //
  //

  late final _contoller1 = MyTonePlayerController(
    id: 1,
    onChangeFrequency: (final value) {
      tonePlayer.setFrequency(1, double.parse(value ?? "0.0"));
    },
    onChangeAmplitude: (final value) {
      tonePlayer.setAmplitude(1, double.parse(value ?? "0.0"));
    },
  );

  //
  //
  //

  bool _isPlaying = false;

  //
  //
  //

  @override
  Widget build(_) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTonePlayer(
                    controller: this._contoller0,
                    color: Colors.teal,
                  ),
                  MyTonePlayer(
                    controller: this._contoller1,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 80.0,
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  iconSize: 40.0,
                  onPressed: () {
                    if (this._isPlaying) {
                      tonePlayer.stop(0);
                      tonePlayer.stop(1);
                    } else {
                      tonePlayer.play(0);
                      tonePlayer.play(1);
                    }

                    this.setState(() {
                      this._isPlaying = !this._isPlaying;
                    });
                  },
                  icon: Icon(
                    this._isPlaying ? Icons.stop : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
