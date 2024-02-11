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
  String statusString = "No Status Listener added yet";
  String valueString = "No Value Listener added yet";

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
    setState(() {
      statusString = status.toString();
    });
  }

  void listener() {
    setState(() {
      valueString = animCont.value.toString();
    });
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
        child: AlignTransition(
          alignment: pGeoAlign,
          child: const CircleAvatar(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
      Text(statusString),
      Text(valueString),
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
                setState(() {
                  statusString = "No Status Listener added yet";
                });
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
                setState(() {
                  valueString = "No Value Listener added yet";
                });

                animCont.removeListener(listener);
              },
              child: const Text("Remove value Listener")),
        ],
      )
    ]);
  }
}
