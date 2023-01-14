import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KeyListview(),
  ));
}

class KeyListview extends StatefulWidget {
  // KeyListview(Key? key) : super(key: key);
  @override
  State<KeyListview> createState() => _KeyListviewState();
}

class _KeyListviewState extends State<KeyListview> {
  //_KeyListviewState();
  var a = List.generate(10, (index) => index.toString());
  void _onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }
      dynamic element = a.removeAt(from);
      a.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView.builder(
        itemCount: a.length,
        itemBuilder: (BuildContext context, int index) {
          return Greenbox(
            ValueKey(a[index]),
          );
        },
        onReorder: _onReorder,
      ),
    );
  }
}

class Greenbox extends StatefulWidget {
  Greenbox(Key? key) : super(key: key);
  @override
  State<Greenbox> createState() => _GreenboxState();
}

class _GreenboxState extends State<Greenbox> {
  _GreenboxState();
  var _text = 'textFromInput';
  _changeText(text) {
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_text),
          TextField(onChanged: _changeText, decoration: InputDecoration())
        ],
      ),
    );
  }
}
