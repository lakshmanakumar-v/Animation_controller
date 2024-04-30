import 'package:animation_controller/animatedwidgets.dart';
import 'package:flutter/material.dart';

class AnimatedController extends StatefulWidget {
  const AnimatedController({super.key});

  @override
  State<AnimatedController> createState() => _AnimatedControllerState();
}

class _AnimatedControllerState extends State<AnimatedController>
    with TickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation animation;
  bool _play = true;
  bool _left = true;

  bool condition = true;
  double _fontSize = 50;
  Color _color = Colors.red;
  double padValue = 0.0;
  double rotate = 0.0;

  rotateImage() {
    setState(() {
      rotate = rotate == 0.0 ? 1 : 0.0;
    });
  }

  paddingValue() {
    setState(() {
      padValue = padValue == 0.0 ? 50 : 0.0;
    });
  }

  animatedIcon() {
    setState(() {
      if (_play == false) {
        animatedController.forward();
        _play = true;
      } else {
        animatedController.reverse();
        _play = false;
      }
    });
  }

  defaultText() {
    setState(() {
      // if(_fontSize==50){
      //   _fontSize=25;
      // }
      // else{
      //   _fontSize=50;
      // }
      _fontSize = _fontSize == 50 ? 25 : 50;
      _color = _color == Colors.red ? Colors.orange : Colors.red;
    });
  }

  changePosition() {
    setState(() {
      _left = !_left;
    });
  }

  

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Controller"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "AnimatedIcon",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: animatedController,
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                animatedIcon();
              },
              child: const Text("acton"),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "AnimatedCrossFade",
              style: TextStyle(fontSize: 25),
            ),
            AnimatedCrossFade(
              firstChild: Image.network(
                  "https://t3.ftcdn.net/jpg/05/35/47/38/360_F_535473874_OWCa2ohzXXNZgqnlzF9QETsnbrSO9pFS.jpg"),
              secondChild: Image.network(
                  "https://images3.alphacoders.com/133/1332803.png"),
              crossFadeState: condition
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  condition = !condition;
                });
              },
              child: const Text("change"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "AnimatedDefaultTextStyle",
              style: TextStyle(fontSize: 25),
            ),
            AnimatedDefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.bold),
              duration: const Duration(seconds: 3000),
              child: Text(
                "Flutter ",
                style: TextStyle(fontSize: _fontSize, color: _color),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                defaultText();
              },
              child: const Text("change Text"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "AnimatedPadding",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: AnimatedPadding(
                padding: EdgeInsets.all(padValue),
                duration: const Duration(seconds: 2),
                curve: Curves.bounceOut,
                child: Container(
                  height: 90,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                paddingValue();
              },
              child: const Text("change padding"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "AnimatedRotation",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedRotation(
              turns: rotate,
              duration: const Duration(seconds: 1),
              child: Image.network(
                "https://img.freepik.com/free-photo/cartoon-animated-penguin-with-headphones_23-2150881938.jpg",
                width: 300,
                height: 200,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                rotateImage();
              },
              child: const Text("Rotate"),
            ),
            const SizedBox(
              height: 20,
            ),
            // AnimatedPositioned(
            //   duration: const Duration(seconds: 2),
            //   left: _left ? 50 : 150,
            //   top: 50,
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     color: Colors.blue,
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AnimatedWidgets();
                  },
                ));
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
