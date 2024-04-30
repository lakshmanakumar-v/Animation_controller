import 'package:animation_controller/widgets.dart';
import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({super.key});

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  double goLeft = 50;
  bool flat = true;
  double logoSize = 100;
  bool _align = true;
  double _opacity = 0.0;

  changePosition() {
    setState(() {
      goLeft = goLeft == 50 ? 150 : 50;
    });
  }

  changeOpacity() {
    setState(() {
      _opacity = _opacity == 0 ? 0.8 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Widgets"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Stack",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 140,
                      height: 140,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 130,
                      height: 130,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Animated Position",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      curve: Curves.easeInOut,
                      left: goLeft,
                      duration: const Duration(seconds: 1),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  changePosition();
                },
                child: const Text("click"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Animated Physical Model",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedPhysicalModel(
                shape: BoxShape.rectangle,
                elevation: flat ? 0.0 : 20,
                color: Colors.white,
                shadowColor: Colors.green.shade900,
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.lightGreen,
                  child: const Center(
                    child: Icon(
                      Icons.verified_user_outlined,
                      size: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    flat = !flat;
                  });
                },
                child: const Text("Click"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Animated size",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSize(
                duration: const Duration(seconds: 1),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        logoSize = logoSize == 100 ? 200 : 100;
                      });
                    },
                    child: FlutterLogo(
                      size: logoSize,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Animated Align",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.yellow,
                child: AnimatedAlign(
                  alignment: _align ? Alignment.bottomLeft : Alignment.topRight,
                  duration: const Duration(seconds: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _align = !_align;
                      });
                    },
                    child: const Icon(
                      Icons.format_align_left_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Animated Opacity",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: Image.network(
                    "https://pbs.twimg.com/media/FJ96vOQWUAwbIah.jpg:large"),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  changeOpacity();
                },
                child: const Text("click"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const WidgetCataglog();
                      },
                    ),
                  );
                },
                child: const Text("Next"),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
