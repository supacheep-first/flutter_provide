import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/todo-Item.dart';
import 'package:hello_world/services/db.dart';

class TodoItemProvider extends ChangeNotifier {
  String _task;
  String get task => _task;

  List<TodoItem> _tasks = [];
  List<TodoItem> get tasks => _tasks;

  List<Widget> get items => _tasks.map((e) => format(e)).toList();

  Widget format(TodoItem item) {
    return Dismissible(
      key: Key(item.id.toString()),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 6, 12, 4),
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item.task,
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              Icon(
                item.complete == true
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () => _toggle(item),
        ),
      ),
      onDismissed: (DismissDirection direction) => _delete(item),
    );
  }

  void create(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("create new task!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            FlatButton(
              onPressed: () =>
                  {_save(), Navigator.of(context).pop(), refresh()},
              child: Text("save"),
            )
          ],
          content: TextField(
            autocorrect: true,
            decoration: InputDecoration(
                labelText: 'Task Name', hintText: 'e.g. pick up bread'),
            onChanged: (value) {
              _task = value;
            },
          ),
        );
      },
    );
  }

  void refresh() async {
    List<Map<String, dynamic>> _result = await DB.query(TodoItem.table);
    _tasks = _result.map((e) => TodoItem.fromMap(e)).toList();
    notifyListeners();
  }

  void _toggle(TodoItem item) async {
    item.complete = !item.complete;
    dynamic result = await DB.update(TodoItem.table, item);
    print(result);
    refresh();
  }

  void _delete(TodoItem item) async {
    await DB.delete(TodoItem.table, item);
    refresh();
  }

  void _save() async {
    TodoItem item = TodoItem(task: _task, complete: false);
    await DB.insert(TodoItem.table, item);
    _task = '';
  }
}
