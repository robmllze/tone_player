// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// MY TONE PLAYER
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils.dart';
import 'main.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTonePlayer extends StatefulWidget {
  //
  //
  //

  final MyTonePlayerController controller;
  final Color color;

  //
  //
  //

  const MyTonePlayer({
    Key? key,
    required this.controller,
    this.color = Colors.teal,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MyTonePlayer> {
  //
  //
  //

  late final _contoller = this.widget.controller;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._contoller._setState = this.setState;
    () async {
      final sharedPreferences_ = await SharedPreferences.getInstance();
      this.setState(() {
        this._contoller._valueFrequency = _MyTonePlayerValue(
          name: "frequency.${this._contoller.id}",
          sharedPreferences: sharedPreferences_,
          onChange: this._contoller.onChangeFrequency,
        );
        if (this._contoller._valueFrequency?.valueAsDouble == null) {
          this._contoller._valueFrequency?.value = 40.0;
        }
        this._contoller._valueAmplitude = _MyTonePlayerValue(
          name: "amplitude.${this._contoller.id}",
          sharedPreferences: sharedPreferences_,
          onChange: this._contoller.onChangeAmplitude,
        );
        if (this._contoller._valueAmplitude?.valueAsDouble == null) {
          this._contoller._valueAmplitude?.value = 0.5;
        }
      });
    }();
  }

  //
  //
  //

  @override
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MyBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextH0("Tone ${this._contoller.id}"),
              const SizedBox(height: 20.0),
              TextField(
                decoration: const InputDecoration(labelText: "Frequency (Hz)"),
                keyboardType: TextInputType.number,
                controller: this._contoller._valueFrequency?.controller,
              ),
              const SizedBox(height: 5.0),
              Slider(
                activeColor: this.widget.color,
                inactiveColor: this.widget.color.withOpacity(0.25),
                thumbColor: this.widget.color,
                min: 0.0,
                max: 500,
                divisions: 20,
                value: this._contoller.frequency <= 500.0 ? this._contoller.frequency : 500.0,
                onChanged: (final value) => this._contoller.frequency = value.roundToDouble(),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (this._contoller.frequency > 0) {
                        this._contoller.frequency -= 10;
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (this._contoller.frequency > 0) {
                        this._contoller.frequency -= 1;
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: this.widget.color,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => this._contoller.frequency = 40.0,
                    icon: Icon(
                      Icons.settings_backup_restore,
                      color: this.widget.color.withOpacity(0.25),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => this._contoller.frequency += 1,
                    icon: Icon(
                      Icons.add,
                      color: this.widget.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () => this._contoller.frequency += 10,
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: const InputDecoration(labelText: "Amplitude"),
                keyboardType: TextInputType.number,
                controller: this._contoller._valueAmplitude?.controller,
              ),
              const SizedBox(height: 5.0),
              Slider(
                activeColor: this.widget.color,
                inactiveColor: this.widget.color.withOpacity(0.25),
                thumbColor: this.widget.color,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                value: this._contoller.amplitude <= 1.0 ? this._contoller.amplitude : 1.0,
                onChanged: (final value) {
                  this._contoller.amplitude = (value * 100.0).roundToDouble() / 100.0;
                },
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final temp = this._contoller.amplitude - 0.1;
                      if (this._contoller.amplitude > 0) {
                        this._contoller.amplitude = (temp * 10.0).roundToDouble() / 10.0;
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => this._contoller.amplitude = 0.5,
                    icon: Icon(
                      Icons.settings_backup_restore,
                      color: this.widget.color.withOpacity(0.25),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      final temp = this._contoller.amplitude + 0.1;
                      this._contoller.amplitude = (temp * 10.0).roundToDouble() / 10.0;
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    tonePlayer.prepare(this.id);
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
