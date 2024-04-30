import 'package:flutter/material.dart';

class TryCatch extends StatefulWidget {
  const TryCatch({super.key});

  @override
  State<TryCatch> createState() => _TryCatchState();
}

class _TryCatchState extends State<TryCatch> {

  void integerDivision() {
    try {
      int res = 1 ~/ 0;
      print(res);
    }
     catch (e) {
      print(e);
    }
  }

  void formatException() {
    try {
      String name = "1,2,3";
      int number = int.parse(name);
      print(number);
    }
     catch (e) {
      print("The error was : $e");
    }
  }

  void noSuchMethodException() {
    try {
      dynamic present = true;
      print(present++);
    }
     catch (e) {
      print("The exception was : $e");
    }
  }

 void ownException(){
  try{
   
  }
  catch(e){

  }
  
 }  

  @override
  void initState() {
    super.initState();
    integerDivision();
    formatException();
    noSuchMethodException();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try Catch"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
    );
  }
}
