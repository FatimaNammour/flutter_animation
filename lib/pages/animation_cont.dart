import 'package:flutter/material.dart';
import 'package:flutter_animation/core/widgets/shared_app_bar.dart';

class AnimCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimContState();
  }
}

class AnimContState extends State<AnimCont>
    with SingleTickerProviderStateMixin {
  late AnimationController animCont;
  late Animation<AlignmentGeometry> pGeoAlign;
  late Animation<AlignmentGeometry> bGeoAlign;

  @override
  void initState() {
    animCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 4));
    pGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(animCont);
    bGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(animCont);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: "Animation Controller"),
      body: Column(children: [
        Expanded(
          child: Stack(
            children: [
              AlignTransition(
                alignment: pGeoAlign,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
              ),
              AlignTransition(
                alignment: bGeoAlign,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  animCont.forward();
                },
                child: const Text("Forward")),
            ElevatedButton(
                onPressed: () {
                  animCont.reverse();
                },
                child: const Text("Reverse")),
            ElevatedButton(
                onPressed: () {
                  animCont.stop();
                },
                child: const Text("Stop")),
            ElevatedButton(
                onPressed: () {
                  animCont.reset();
                },
                child: const Text("Reset")),
            ElevatedButton(
                onPressed: () {
                  animCont.repeat();
                },
                child: const Text("Repeat")),
            ElevatedButton(
                onPressed: () {
                  animCont.repeat(reverse: true);
                },
                child: const Text("Repeat(rv=true)")),
          ],
        )
      ]),
    );
  }
}
