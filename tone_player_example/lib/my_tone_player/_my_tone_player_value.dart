// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

part of 'my_tone_player.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _MyTonePlayerValue {
  //
  //
  //

  final String name;
  final SharedPreferences sharedPreferences;
  late final TextEditingController controller;
  void Function(String?)? onChange;

  //
  //
  //

  _MyTonePlayerValue({
    required this.name,
    required this.sharedPreferences,
    required this.onChange,
  }) {
    final value_ = sharedPreferences.getString(this.name);
    this.controller = TextEditingController(text: value_);
    this.onChange?.call(value_);
  }

  //
  //
  //

  set value(dynamic value) {
    final valueAsString = value.toString();
    this.onChange?.call(valueAsString);
    this.sharedPreferences.setString(this.name, valueAsString);
    this.controller.text = valueAsString;
  }

  //
  //
  //

  String? get value {
    final value_ = this.controller.text;
    return value_.isEmpty ? null : value_;
  }

  //
  //
  //

  double? get valueAsDouble => double.tryParse(this.controller.text);
}
