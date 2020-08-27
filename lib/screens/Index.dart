import 'package:flutter/material.dart';
import 'package:hello_world/providers/CounterProvider.dart';
import 'package:hello_world/providers/EventProvider.dart';
import 'package:hello_world/screens/EventPage.dart';
import 'package:hello_world/screens/counterPage.dart';
import 'package:provider/provider.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App!!",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterProvider>(
              create: (_) => CounterProvider()),
          StreamProvider(
            create: (_) => EventProvider().intStream(),
            initialData: 0,
          ),
        ],
        child: DefaultTabController(
          length: 2,
          child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Simple APP Flutter"),
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.code)),
                      Tab(icon: Icon(Icons.zoom_in)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [CounterPage(), EventPage()],
                ),
              )),
        ),
      ),
    );
  }
}
