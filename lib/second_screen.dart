import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda pantalla')),
      body: const Center(
        child: Text(
          '¡Has navegado a otra pantalla!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
