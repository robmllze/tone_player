// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
// Email: robmllze@gmail.com
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTextH0 extends Text {
  const MyTextH0(String text, {Key? key})
      : super(
          key: key,
          text,
          style: const TextStyle(
            fontSize: 23.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTextH1 extends Text {
  const MyTextH1(String text, {Key? key})
      : super(
          key: key,
          text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTextH2 extends Text {
  const MyTextH2(String text, {Key? key})
      : super(
          key: key,
          text,
          style: const TextStyle(
            fontSize: 17.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTextBody extends SelectableText {
  const MyTextBody(String text, {Key? key})
      : super(
          key: key,
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14.0,
          ),
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyBox extends StatelessWidget {
  final Widget? child;
  final Color color;
  const MyBox({
    Key? key,
    this.child,
    this.color = Colors.teal,
  }) : super(key: key);

  @override
  Widget build(_) {
    return Container(
      decoration: BoxDecoration(
        color: this.color.withOpacity(0.1),
        border: Border.all(color: this.color),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
