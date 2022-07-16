# Project Report & Notes

## Prerequisites

1. Knowledge in Dart/Flutter
2. Access to a macOS computer
3. Installed (macOS)
    - Flutter
    - VS Code with Dart/Flutter plugins
    - XCode
    - Android Studio
    - JUCE with Projucer (https://juce.com/get-juce/download)
4. An iPhone plugged in via USB for debugging on iOS
5. An Android plugged in via USB for debugging on Android
6. "USB" debugging enabled on the Android device

## Creating the `tone_test` project in Juce

1. Open Projucer and create a new Console application with the following enabled:
    - modules -> juce_audio_basics
    - modules -> juce_audio_devices
    - exporters -> Xcode (macOS)
3. Open the project in XCode via Projucer by clicking on the XCode icon
4. Open `Main.cpp` and write the code available in `tone_test/Source/Main.cpp`
5. Run the application.

This should play a test tone for 2 seconds.

## Creating the `tonelib` project in Juce

1. Open Projucer and create a new Dynamic Library with the following enabled:
    - modules -> juce_audio_basics
    - modules -> juce_audio_devices
    - exporters -> Xcode (iOS)
    - exporters -> Android
3. Create a new file `tonelib.cpp` in `Source/` and write the code available in `tonelib/Source/tonelib.cpp`
4. Open the project in Android Studio via Projucer by clicking on the Android Studio icon
5. Build the project in Android Studio
6. Create a new folder `tone_player/example/android/app/src/main/jniLibs/`
7. Copy the folders in `tonelib/Builds/Android/lib/build/intermediates/cmake/debug_Debug/obj` and paste them in the new folder.

...



## Creating the package in Flutter

1. See: https://docs.flutter.dev/development/packages-and-plugins/developing-packages
2. Open VS Code or a terminal and run the following:
```
flutter create --org com.robmllze --template=plugin --platforms=android,ios,macos tone_player
```
3. Delete folders `test/` and `example/test/` as they won't be needed


## References

- https://docs.flutter.dev/development/packages-and-plugins/developing-packages
- https://docs.flutter.dev/development/platform-integration/macos/c-interop#step-1-create-a-plugin
- https://github.com/audiooffler/JucyFluttering
