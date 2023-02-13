import 'package:dropdown_textfield/dropdown_textfield.dart';
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
    SingleValueDropDownController controllerStatus =
        SingleValueDropDownController();
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
                DropDownTextField(
                  controller: controllerStatus,
                  clearOption: true,
                  textFieldDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Status',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 2,
                  dropDownList: const [
                    DropDownValueModel(
                      name: 'Idle',
                      value: 'idle',
                      toolTipMsg: 'Ketika perangkat tersedia untuk digunakan',
                    ),
                    DropDownValueModel(
                      name: 'Rented',
                      value: 'rented',
                      toolTipMsg: 'Ketika perangkat sedang disewa',
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: (() {}),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
