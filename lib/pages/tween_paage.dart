import 'package:flutter/material.dart';
import 'package:flutter_animation/core/widgets/shared_app_bar.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return TweenPageState();
  }
}

class TweenPageState extends State<TweenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: "Tween examples"),
      body: Center(
          child: Wrap(
        children: [
          Column(
            children: [
              const Text("Integer Tween:"),
              TweenAnimationBuilder(
                tween: IntTween(begin: 0, end: 100),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 100),
                  );
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
