package com.example.example;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.Context;
import android.os.Bundle;
import com.rmsl.juce.Java;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


public class MainActivity extends FlutterActivity {
    //
    //
    //

    private static final String CHANNEL = "com.example";
    private static Context m_currentContext = null;

    //
    //
    //

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
            (call, result) -> {
                // // This method is invoked on the main thread.
                // if (call.method.equals("getLuckyNumber")) {
                // int luckyNumber = getLuckyNumber();
                // result.success(luckyNumber);
                // // result.error("Uhm, error!", null);
                // } else {
                // result.notImplemented();
                // }
            }
        );
    }

    //
    //
    //

    @Override
    public void onCreate(Bundle savedInstanceState) {
        Java.initialiseJUCE(this);
        m_currentContext = this;
        super.onCreate(savedInstanceState);
    }

    //
    //
    //

    @Override
    protected void onResume()
    {
        m_currentContext = this;
        super.onResume();
    }

    //
    //
    //

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    //
    //
    //

    // int getLuckyNumber() {
    //     return 42;
    // }
}