import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomColors(),
    );
  }
}

class RandomColors extends StatefulWidget {
  const RandomColors({Key? key}) : super(key: key);

  @override
  _RandomColorsState createState() => _RandomColorsState();
}

class _RandomColorsState extends State<RandomColors> {
  final Map<String, Color> _colors = {
    "Blue": Colors.blue,
    "Red": Colors.red,
    "Green": Colors.green,
    "Yellow": Colors.yellow
  };
  Color color =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test task by Artem Yatskiv'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: color,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  color = Color((Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0);
                });
              },
            ),
          ),
          const Center(
            child: Text('Hey there'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Choose a background color'),
                  content: setupAlertDialogContainer(context),
                );
              });
        },
        tooltip: 'Choose a color',
        child: const Icon(Icons.color_lens),
      ),
    );
  }

  Widget setupAlertDialogContainer(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: _colors.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: _colors.values.elementAt(index),
                  title: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_colors.keys.elementAt(index)),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      color = _colors.values.elementAt(index);
                    });
                    Navigator.pop(context);
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }
}
