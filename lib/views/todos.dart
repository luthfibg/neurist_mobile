import 'package:flutter/material.dart';
import 'package:neurist_mobile/customs/theme.dart';
import 'package:neurist_mobile/views/views2/todo_add.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkAccent,
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: ((context) => const AddTodo()),
    );
    Navigator.push(context, route);
  }
}
