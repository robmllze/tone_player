import 'package:flutter/material.dart';
import 'tabs/tab_1.dart';
import 'tabs/tab_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(_) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SPH Tone Player Demo"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info_outline)),
              Tab(icon: Icon(Icons.music_note_outlined)),
              Tab(icon: Icon(Icons.science_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TabInfo(),
            Tab1(),
            Icon(Icons.science_outlined),
          ],
        ),
      ),
    );
  }
}
