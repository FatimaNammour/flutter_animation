import 'package:flutter/material.dart';

class AnimCont5 extends StatefulWidget {
  const AnimCont5({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimCont5State();
  }
}

class AnimCont5State extends State<AnimCont5>
    with SingleTickerProviderStateMixin {
  late Animation<double> _turns;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));
    _turns = Tween<double>(begin: 0, end: 1).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      RotationTransition(
          turns: _turns,
          child: const FlutterLogo(
            size: 150,
          )),
      ElevatedButton(
          onPressed: () {
            if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          child: const Text("Animate")),
    ]);
  }
}
