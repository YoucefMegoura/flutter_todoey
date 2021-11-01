import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TestApp());
}

class Data extends ChangeNotifier {
  String dataString = 'Some data ...';

  void refreshData(String newString) {
    dataString = newString;
    notifyListeners();
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Data>(
          create: (BuildContext context) => Data(),
          builder: (context, widget) {
            return Scaffold(
              appBar: AppBar(
                title: Text(context.watch<Data>().dataString),
              ),
              body: Center(
                child: Level1(),
              ),
            );
          }),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Level2(), Text(context.watch<Data>().dataString)],
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Level3(),
        TextField(
          onChanged: (String value) {
            context.read<Data>().refreshData(value);
          },
        )
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
