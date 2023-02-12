import 'package:flutter/material.dart';

class InsertDevice extends StatefulWidget {
  const InsertDevice({super.key});

  @override
  State<InsertDevice> createState() => _InsertDeviceState();
}

class _InsertDeviceState extends State<InsertDevice> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerValue = TextEditingController();
    TextEditingController controllerStatus = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Insertion'),
      ),
      body: Center(
        child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Device Name',
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(
                  width: 100,
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controllerValue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Price',
                  ),
                ),
                const SizedBox(
                  width: 100,
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controllerStatus,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Status',
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
