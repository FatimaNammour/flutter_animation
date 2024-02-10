import 'dart:developer';

import 'package:flutter/material.dart';

class AnimCont3 extends StatefulWidget {
  const AnimCont3({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimCont3State();
  }
}

class AnimCont3State extends State<AnimCont3> with TickerProviderStateMixin {
  late AnimationController pinkAnimCont;
  late AnimationController blackAnimCont;
  late Animation<AlignmentGeometry> pGeoAlign;
  late Animation<AlignmentGeometry> bGeoAlign;

  @override
  void initState() {
    pinkAnimCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));

    blackAnimCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));

    pGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(pinkAnimCont);

    bGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
        parent: blackAnimCont,
        curve: Curves.ease,
        reverseCurve: Curves.easeInOut));

    super.initState();

    pinkAnimCont.addListener(() {
      log("value of  panimcont ========================  ${pinkAnimCont.value}");
      log("value of banimcont ========================  ${blackAnimCont.value}");

      if (pinkAnimCont.value >= 0.5 && blackAnimCont.value == 0) {
        blackAnimCont.forward();
      }
      if (pinkAnimCont.value <= 0.5 && blackAnimCont.value == 1) {
        blackAnimCont.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Stack(
          children: [
            AlignTransition(
              alignment: pGeoAlign,
              child: const CircleAvatar(
                backgroundColor: Colors.pink,
              ),
            ),
            AlignTransition(
              alignment: bGeoAlign,
              child: const CircleAvatar(
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
                pinkAnimCont.forward();
              },
              child: const Text("Forward")),
          ElevatedButton(
              onPressed: () {
                pinkAnimCont.reverse();
              },
              child: const Text("Reverse")),
          ElevatedButton(
              onPressed: () {
                pinkAnimCont.stop();
              },
              child: const Text("Stop")),
          ElevatedButton(
              onPressed: () {
                pinkAnimCont.reset();
              },
              child: const Text("Reset")),
        ],
      )
    ]);
  }
}
