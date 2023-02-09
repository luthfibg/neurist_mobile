import 'package:flutter/material.dart';

class InsertDevice extends StatelessWidget {
  const InsertDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Insertion'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: const Text('This is insert form page!'),
        ),
      ),
    );
  }
}
