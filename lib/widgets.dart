import 'package:animation_controller/userscreen.dart';
import 'package:flutter/material.dart';

class WidgetCataglog extends StatefulWidget {
  const WidgetCataglog({super.key});

  @override
  State<WidgetCataglog> createState() => _WidgetCataglogState();
}

class _WidgetCataglogState extends State<WidgetCataglog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleController;
  late AnimationController _heartbeatController;
  late AnimationController _decoration;
  late AnimationController _slideTransition;
  late Animation _heartbeat;
  late Animation<double> _fade;
  late Animation<double> _turns;
  late Animation<double> _curves;

  double _scale = 1.0;
  Offset _offset = Offset.zero;
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;

  late final Animation<Offset> _position = Tween(
    begin: Offset.zero,
    end: const Offset(2.5, 0.0),
  ).animate(_slideTransition);

  final DecorationTween decorationtween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.green,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(60.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 3.0,
            blurRadius: 10.0,
            offset: Offset(0, 5.0),
          ),
        ]),
    end: BoxDecoration(
      color: Colors.white,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
    ),
  );

  changeScale() {
    setState(() {
      _scale = _scale == 1.0 ? 1.5 : 1.0;
    });
  }

  slideUp() {
    setState(() {
      // _offset = _offset == const Offset(0, 0)
      //     ? const Offset(0, -0.3)
      //     : const Offset(0, 0);
      _offset -= const Offset(0, 0.3);
    });
  }

  slideDown() {
    setState(() {
      // _offset = _offset == const Offset(0, 0)
      //     ? const Offset(0, 0.3)
      //     : const Offset(0, 0);
      _offset += const Offset(0, 0.3); 
    });
  }

  animatedContainer() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.orange : Colors.blue;
    });
  }

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _heartbeatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _decoration = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _slideTransition = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _curves = CurvedAnimation(
        parent: _scaleController, curve: Curves.fastLinearToSlowEaseIn);
    _turns = Tween(begin: 1.0, end: 2.0).animate(_animationController);
    _fade = Tween(begin: 0.0, end: 3.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),);
    _heartbeat = Tween(begin: 180.0, end: 160.0).animate(CurvedAnimation(
        parent: _heartbeatController, curve: Curves.easeOutBack),);
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
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Animated Container",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                width: _width,
                height: _height,
                color: _color,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(),
              ),
              ElevatedButton(
                onPressed: () {
                  animatedContainer();
                },
                child: const Text("change Container"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Animated scale",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              AnimatedScale(
                scale: _scale,
                duration: const Duration(seconds: 1),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  changeScale();
                },
                child: const Text("change scale"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Animated Slide",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.lightGreen,
                child: AnimatedSlide(
                  offset: _offset,
                  duration: const Duration(seconds: 2),
                  child: const Icon(Icons.emoji_emotions),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      slideUp();
                    },
                    child: const Text("SlideUp"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      slideDown();
                    },
                    child: const Text("SlideDown"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _offset -= const Offset(0.3, 0);
                      });
                    },
                    child: const Text("Slideleft"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _offset += const Offset(0.3, 0);
                      });
                    },
                    child: const Text("SlideRight"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Animated Builder",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blueGrey,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Icon(
                      Icons.favorite,
                      size: _heartbeat.value,
                      color: Colors.red,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Fade Transition",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.lightBlue,
                child: FadeTransition(
                  opacity: _fade,
                  child: const Icon(
                    Icons.emoji_people,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Rotation Transition",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.purpleAccent,
                child: RotationTransition(
                  turns: _turns,
                  child: const Icon(
                    Icons.sunny,
                    size: 150,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hero Widget",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                child: Hero(
                  tag: "UserProfile",
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const UserProfile();
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.portrait_rounded,
                          size: 50,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          "Click the user profile navigate to new screen",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Scale Transition",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ScaleTransition(
                scale: _curves,
                child: Image.network(
                    "https://t3.ftcdn.net/jpg/05/83/42/52/360_F_583425281_COvLaLIZLEBZZzSpBbOSZO1Gq0BKEZTV.jpg"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DecoratedBox Transition",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              DecoratedBoxTransition(
                decoration: decorationtween.animate(_decoration),
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Icon(
                    Icons.apple,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "SlideTransition",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              SlideTransition(
                position: _position,
                child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 6,
                          blurStyle: BlurStyle.outer),
                    ]),
                    //color: Colors.purple,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Slide Widget",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
