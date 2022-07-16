// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

part of 'my_tone_player.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTonePlayerController {
  //
  //
  //

  final int id;
  _MyTonePlayerValue? _valueFrequency, _valueAmplitude;
  void Function(void Function())? _setState;
  void Function(String?)? onChangeFrequency, onChangeAmplitude;

  //
  //
  //

  MyTonePlayerController({
    required this.id,
    this.onChangeFrequency,
    this.onChangeAmplitude,
  }) {
    main.tonePlayer.prepare(this.id);
  }

  //
  //
  //

  double get frequency => this._valueFrequency?.valueAsDouble ?? 0.0;

  //
  //
  //

  double get amplitude => this._valueAmplitude?.valueAsDouble ?? 0.0;

  //
  //
  //

  set frequency(double value) => this._setState?.call(() => this._valueFrequency?.value = value);

  //
  //
  //

  set amplitude(double value) => this._setState?.call(() => this._valueAmplitude?.value = value);
}
