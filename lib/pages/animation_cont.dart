import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/animation_cont1.dart';
import 'package:flutter_animation/pages/animation_cont2.dart';

class AnimCont extends StatefulWidget {
  const AnimCont({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimContState();
  }
}

class AnimContState extends State<AnimCont> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("one controller")),
              Tab(child: Text("tow controller")),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimCont1(),
            AnimCont2(),
          ],
        ),
      ),
    );
  }
}
