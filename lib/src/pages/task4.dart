import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class Task4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      title: 'Task 4',
      color: Colors.purple,
      child: ListView(
        children: [
          for (var line in loremIpsum) PictureLine(line),
        ],
      ),
    );
  }
}

class Task4Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Colors.indigo, Colors.purple],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'The issue on the last task is most apparent '
            'the *first time* you visit it, so get ready with DevTools.',
            style: Theme.of(context).textTheme.headline6.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PictureLine extends StatelessWidget {
  static const List<String> _pictures = [
    'assets/pleased_4k.jpg',
    'assets/happy_4k.jpg',
    'assets/angry_4k.jpg',
    'assets/suspicious_4k.jpg',
    'assets/blissful_4k.jpg',
  ];

  final String line;

  PictureLine(this.line, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset(
              _pictures[line.hashCode % _pictures.length],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(line),
          ),
        ],
      ),
    );
  }
}