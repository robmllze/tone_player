// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// References:
// - https://docs.flutter.dev/development/platform-integration/macos/c-interop#step-1-create-a-plugin
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'dart:io';
import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TonePlayer {
  //
  //
  //

  late final ffi.DynamicLibrary library;

  //
  //
  //

  TonePlayer() {
    this.library = Platform.isAndroid //
        ? ffi.DynamicLibrary.open("libjuce_jni.so")
        : ffi.DynamicLibrary.process();
    this._init();
  }

  //
  //
  //

  late final getLibName = (this.library.lookup<ffi.Utf8>("lib_name")).toDartString();

  //
  //
  //

  late final _init = this.library.lookupFunction //
      <ffi.Int32 Function(), int Function()>("init");

  //
  //
  //

  late final close = this.library.lookupFunction //
      <ffi.Void Function(), void Function()>("close");

  //
  //
  //

  late final setFrequency = this.library.lookupFunction //
      <ffi.Void Function(ffi.Int32, ffi.Double), void Function(int, double)>("set_frequency");

  //
  //
  //

  late final setAmplitude = this.library.lookupFunction //
      <ffi.Void Function(ffi.Int32, ffi.Double), void Function(int, double)>("set_amplitude");

  //
  //
  //

  late final prepare = this.library.lookupFunction //
      <ffi.Void Function(ffi.Int32), void Function(int)>("prepare");

  //
  //
  //

  late final play = this.library.lookupFunction //
      <ffi.Void Function(ffi.Int32), void Function(int)>("play");

  //
  //
  //

  late final stop = this.library.lookupFunction //
      <ffi.Void Function(ffi.Int32), void Function(int)>("stop");
}
