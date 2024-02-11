import 'package:flutter/material.dart';
import 'package:flutter_animation/core/constants/urls.dart';
import 'package:flutter_animation/core/widgets/shared_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  double dimension = 100;
  Color _conColor = Colors.purple;
  String imageUrl = imagesUrls[0];
  Alignment alignment = Alignment.bottomLeft;
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: "Animated Foo Widgets"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    curve: Curves.elasticOut,
                    duration: const Duration(seconds: 2),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    width: dimension,
                    height: dimension,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (dimension == 100) {
                            dimension = 200;
                          } else {
                            dimension = 100;
                          }
                        });
                      },
                      child: const Text("Scale container")),
                ],
              ),
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                        color: _conColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    width: 100,
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_conColor == Colors.purple) {
                            _conColor = Colors.green;
                          } else {
                            _conColor = Colors.purple;
                          }
                        });
                      },
                      child: const Text("Change color")),
                ],
              ),
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imageUrl)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    width: 200,
                    height: 200,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (imageUrl == imagesUrls[0]) {
                            imageUrl = imagesUrls[1];
                          } else {
                            imageUrl = imagesUrls[0];
                          }
                        });
                      },
                      child: const Text("Change image")),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 100,
                    width: 150,
                    child: AnimatedAlign(
                      alignment: alignment,
                      duration: const Duration(seconds: 2),
                      child: const Text("kjfhgkjfdb",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (alignment == Alignment.bottomLeft) {
                            alignment = Alignment.topRight;
                          } else {
                            alignment = Alignment.bottomLeft;
                          }
                        });
                      },
                      child: const Text("Change align")),
                ],
              ),
              Column(
                children: [
                  AnimatedRotation(
                    turns: _turns,
                    duration: const Duration(seconds: 2),
                    child: const FlutterLogo(size: 100),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text("Rotate Right")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _turns = _turns - 0.5;
                            });
                          },
                          child: const Text("Rotate left")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
