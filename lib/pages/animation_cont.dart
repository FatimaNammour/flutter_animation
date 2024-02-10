import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/add_dispose_listeners.dart';
import 'package:flutter_animation/pages/foo_transtion_anim_controller.dart';
import 'package:flutter_animation/pages/foo_transtion_listen_to_value.dart';
import 'package:flutter_animation/pages/foo_transtion_listen_to_status.dart';

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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Foo Transition",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          bottom: const TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.all(5),
            padding: EdgeInsets.all(0),
            tabs: [
              Tab(child: Text("one controller")),
              Tab(child: Text("tow controller")),
              Tab(child: Text("Listen to value")),
              Tab(child: Text("status & value listner")),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimCont1(),
            AnimCont2(),
            AnimCont3(),
            AnimCont4(),
          ],
        ),
      ),
    );
  }
}
