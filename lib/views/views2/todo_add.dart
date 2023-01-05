import 'package:flutter/material.dart';
import 'package:neurist_mobile/customs/theme.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkAccent,
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title'),
            style: TextStyle(
              color: AppColors.primaryAppColor3,
            ),
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Content'),
            style: TextStyle(
              color: AppColors.primaryAppColor3,
            ),
          ),
        ],
      ),
    );
  }
}
