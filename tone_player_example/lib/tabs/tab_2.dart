// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
// Email: robmllze@gmail.com
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';

import '/main.dart' as main;
import '/my_tone_player/my_tone_player.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Tab2 extends StatefulWidget {
  //
  //
  //

  const Tab2({Key? key}) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<Tab2> with WidgetsBindingObserver {
  //
  //
  //

  bool _isPlaying = false;
  double _frequency = 0.0;
  double _offset = 0.0;

  //
  //
  //

  late final _contoller = MyTonePlayerController(
    id: 3,
    onChangeFrequency: (final value) {
      if (value != null) {
        this._frequency = double.tryParse(value) ?? 40.0;
        main.tonePlayer.setFrequency(2, this._frequency);
        main.tonePlayer.setFrequency(3, this._frequency + this._offset);
      }
    },
    onChangeAmplitude: (final value) {
      if (value != null) {
        final amplitude = double.tryParse(value) ?? 1.0;
        main.tonePlayer.setAmplitude(2, amplitude);
        main.tonePlayer.setAmplitude(3, amplitude);
      }
    },
    onChangeOffset: (final value) {
      if (value != null) {
        this._offset = double.tryParse(value) ?? 0.0;
        main.tonePlayer.setFrequency(2, this._frequency);
        main.tonePlayer.setFrequency(3, this._frequency + this._offset);
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
                  MyTonePlayerOffset(
                    controller: this._contoller,
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
                        ..stop(2)
                        ..stop(3);
                    } else {
                      main.tonePlayer
                        ..play(2)
                        ..play(3);
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
