import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("News App")),
        backgroundColor: Color.fromARGB(255, 142, 183, 255),
      ),
    );
  }
}
