// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Author: Robert Mollentze
// Email: robmllze@gmail.com
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
            MyTextH0("About"),
            SizedBox(height: 10.0),
            MyBox(
              child: MyTextBody(
                "This app was developed for Stress Point Health. "
                "It demonstrates the use of JUCE with Flutter on Android and "
                "iOS. The full source code is available on GitHub",
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
