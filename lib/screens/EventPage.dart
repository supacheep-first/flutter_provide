import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var _value = Provider.of<int>(context);
    // var _value = Provider.of<EventProvider>(context).intStream().toString();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('StremProvider Example'),
            Consumer<int>(
              builder: (context, eventp, child) {
                return Text(
                  '${eventp.toString()}',
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
          ],
        ),
      ),
    );

    // return Container(
    //     child: Center(
    //         child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text('StreamProvider Example'),
    //     SizedBox(height: 150),
    //     Text(
    //       '${_value.toString()}',
    //       style: Theme.of(context).textTheme.headline1,
    //     )
    //   ],
    // )));
  }
}
