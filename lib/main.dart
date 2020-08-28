import 'package:flutter/material.dart';
import 'package:hello_world/screens/index.dart';
import 'package:hello_world/services/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Index();
  }
}

// should create index page for manage tab
