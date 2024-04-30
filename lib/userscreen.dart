import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User profile Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Hero(
          tag: "userProfile",
          child: Container(
            height: 100,
            width: 100,
            child: const Icon(Icons.portrait_rounded,size: 150,)
          ),
        ),
      ),
    );
  }
}
