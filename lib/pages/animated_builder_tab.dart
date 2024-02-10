import 'package:flutter/material.dart';
import 'package:flutter_animation/core/widgets/shared_app_bar.dart';

class AnimatedBuilderTab extends StatefulWidget {
  const AnimatedBuilderTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimatedBuilderTabStare();
  }
}

class AnimatedBuilderTabStare extends State<AnimatedBuilderTab>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = ColorTween(begin: Colors.purple, end: Colors.black)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: "Animated Builder"),
      body: Column(children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _animationController,
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Animated",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  Text("Builder",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  Text("Widget",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ]),
            builder: (context, child) {
              return Container(
                width: 200,
                color: _animation.value,
                child: child,
                // child: const Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Text("Animated",
                //           style: TextStyle(color: Colors.white, fontSize: 30)),
                //       Text("Builder",
                //           style: TextStyle(color: Colors.white, fontSize: 30)),
                //       Text("Widget",
                //           style: TextStyle(color: Colors.white, fontSize: 30)),
                //     ]),
              );
            },
          ),
        ),
        const Spacer(),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  _animationController.forward();
                },
                child: const Text("forward")),
            ElevatedButton(
                onPressed: () {
                  _animationController.reverse();
                },
                child: const Text("reverse")),
            ElevatedButton(
                onPressed: () {
                  _animationController.stop();
                },
                child: const Text("stop")),
          ],
        )
      ]),
    );
  }
}
