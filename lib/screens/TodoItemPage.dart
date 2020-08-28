import 'package:flutter/material.dart';
import 'package:hello_world/providers/TodoItemProvider.dart';
import 'package:provider/provider.dart';

class TodoItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoItemProvider>(
      builder: (context, todo, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('this page use SQLlite'),
          ),
          body: ListView(
            children: todo.items,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              todo.create(context);
            },
            tooltip: 'New TODO',
            child: Icon(Icons.library_add),
          ),
        );
      },
    );
  }
}
