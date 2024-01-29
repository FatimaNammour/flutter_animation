import 'package:flutter/material.dart';

class AnimCont1 extends StatefulWidget {
  const AnimCont1({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimCont1State();
  }
}

class AnimCont1State extends State<AnimCont1>
    with SingleTickerProviderStateMixin {
  late AnimationController animCont;
  late Animation<AlignmentGeometry> pGeoAlign;
  late Animation<AlignmentGeometry> bGeoAlign;

  @override
  void initState() {
    animCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));
    pGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(animCont);
    bGeoAlign = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
        parent: animCont,
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceInOut));
    super.initState();
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
    ]);
  }
}
