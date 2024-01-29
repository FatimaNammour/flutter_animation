import 'package:flutter/material.dart';

class AnimCont2 extends StatefulWidget {
  const AnimCont2({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimCont2State();
  }
}

class AnimCont2State extends State<AnimCont2> with TickerProviderStateMixin {
  late AnimationController pinkAnimCont;
  late AnimationController blackAnimCont;
  late Animation<AlignmentGeometry> pGeoAlign;
  late Animation<AlignmentGeometry> bGeoAlign;

  @override
  void initState() {
    pinkAnimCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));

    blackAnimCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));

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

    pinkAnimCont.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          blackAnimCont.status == AnimationStatus.dismissed) {
        blackAnimCont.forward();
      }
      if (status == AnimationStatus.dismissed &&
          blackAnimCont.status == AnimationStatus.completed) {
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
          ElevatedButton(
              onPressed: () {
                pinkAnimCont.repeat();
                blackAnimCont.reset();
              },
              child: const Text("Repeat")),
          ElevatedButton(
              onPressed: () {
                pinkAnimCont.repeat(reverse: true);
              },
              child: const Text("Repeat(rv=true)")),
        ],
      )
    ]);
  }
}
