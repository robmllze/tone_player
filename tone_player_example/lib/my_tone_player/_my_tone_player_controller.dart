// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
// Email: robmllze@gmail.com
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

part of 'my_tone_player.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTonePlayerController {
  //
  //
  //

  final int id;
  _MyTonePlayerValue? _valueFrequency, _valueAmplitude, _valueOffset;
  void Function(void Function())? _setState;
  void Function(String?)? onChangeFrequency, onChangeAmplitude, onChangeOffset;

  //
  //
  //

  MyTonePlayerController({
    required this.id,
    this.onChangeFrequency,
    this.onChangeAmplitude,
    this.onChangeOffset,
  });

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

  double get offset => this._valueOffset?.valueAsDouble ?? 0.0;

  //
  //
  //

  set frequency(double value) => this._setState?.call(() => this._valueFrequency?.value = value);

  //
  //
  //

  set amplitude(double value) => this._setState?.call(() => this._valueAmplitude?.value = value);

  //
  //
  //

  set offset(double value) => this._setState?.call(() => this._valueOffset?.value = value);
}
