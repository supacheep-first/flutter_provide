import 'package:flutter/material.dart';
import 'package:hello_world/providers/CounterProvider.dart';
import 'package:hello_world/screens/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Index();
  }
}

// should create index page for manage tab
