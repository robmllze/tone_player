// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';

import '/main.dart' as main;
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

class _State extends State<Tab1> with WidgetsBindingObserver {
  //
  //
  //

  bool _isPlaying = false;

  //
  //
  //

  late final _contoller0 = MyTonePlayerController(
    id: 0,
    onChangeFrequency: (final value) {
      if (value != null) {
        final frequency = double.tryParse(value) ?? 40.0;
        main.tonePlayer.setFrequency(0, frequency);
      }
    },
    onChangeAmplitude: (final value) {
      if (value != null) {
        final amplitude = double.tryParse(value) ?? 1.0;
        main.tonePlayer.setAmplitude(0, amplitude);
      }
    },
  );

  //
  //
  //

  late final _contoller1 = MyTonePlayerController(
    id: 1,
    onChangeFrequency: (final value) {
      if (value != null) {
        final frequency = double.tryParse(value) ?? 40.0;
        main.tonePlayer.setFrequency(0, frequency);
      }
    },
    onChangeAmplitude: (final value) {
      if (value != null) {
        final amplitude = double.tryParse(value) ?? 1.0;
        main.tonePlayer.setAmplitude(0, amplitude);
      }
    },
  );

  //
  //
  //

  @override
  Future<bool> didPopRoute() async {
    main.tonePlayer.close();
    return false;
  }

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
                  MyTonePlayerSingle(
                    controller: this._contoller0,
                    color: Colors.teal,
                  ),
                  MyTonePlayerSingle(
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
                      main.tonePlayer
                        ..stop(0)
                        ..stop(1);
                    } else {
                      main.tonePlayer
                        ..play(0)
                        ..play(1);
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
