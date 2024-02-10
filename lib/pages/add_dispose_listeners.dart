import 'dart:developer';

import 'package:flutter/material.dart';

class AnimCont4 extends StatefulWidget {
  const AnimCont4({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimCont4State();
  }
}

class AnimCont4State extends State<AnimCont4>
    with SingleTickerProviderStateMixin {
  late AnimationController animCont;
  late Animation<AlignmentGeometry> pGeoAlign;

  @override
  void initState() {
    animCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));
    pGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(animCont);

    super.initState();
  }

  void statusListener(AnimationStatus status) {
    log("status issssssssssssssssssss   ${status.toString()}");
  }

  void listener() {
    log("value issssssssssssssssssss   ${animCont.value.toString()}");
  }

  @override
  void dispose() {
    animCont.dispose();
    super.dispose();
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
          ],
        ),
      ),
      ElevatedButton(
          onPressed: () {
            if (animCont.status == AnimationStatus.completed) {
              animCont.reverse();
            } else {
              animCont.forward();
            }
          },
          child: const Text("Animate")),
      Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                animCont.addStatusListener(statusListener);
              },
              child: const Text("Add Status Listener")),
          ElevatedButton(
              onPressed: () {
                animCont.removeStatusListener(statusListener);
              },
              child: const Text("Remove Status Listener")),
          ElevatedButton(
              onPressed: () {
                animCont.addListener(listener);
              },
              child: const Text("Add value Listener")),
          ElevatedButton(
              onPressed: () {
                animCont.removeListener(listener);
              },
              child: const Text("Remove value Listener")),
        ],
      )
    ]);
  }
}
