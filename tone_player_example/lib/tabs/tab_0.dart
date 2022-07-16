// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

import 'package:flutter/widgets.dart';

import '/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Tab0 extends StatelessWidget {
  //
  //
  //

  const Tab0({Key? key}) : super(key: key);

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 10.0),
            MyTextH0("Background"),
            SizedBox(height: 10.0),
            MyBox(
              child: MyTextBody(
                "This demo was developed for Stress Point Health. "
                "It demonstrates the use of JUCE with Flutter on Android and "
                "iOS. It uses a library developed in Projucer/C++. "
                "The full source code is available, as well as written steps "
                "to reproduce this project from scratch. "
                "The source code is relatively straightforward and any "
                "competent Flutter and/or C++ developer should be able to "
                "quickly understand it",
              ),
            ),
            SizedBox(height: 10.0),
            MyTextH0("Version"),
            SizedBox(height: 10.0),
            MyBox(
              child: MyTextBody(
                "Demo Version 1.0 (July 2022)",
              ),
            ),
            SizedBox(height: 10.0),
            MyTextH0("Developer"),
            SizedBox(height: 10.0),
            MyBox(
              child: MyTextBody(
                "Developed by Robert Mollentze\n\n"
                "ABN: 86282501686\n"
                "Email: robmllze@gmail.com\n"
                "Phone/WhatsApp: 0479100711",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
