import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class OrangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.orange,
      child: ListView(
        children: [
          for (var line in loremIpsum) PictureLine(line),
        ],
      ),
    );
  }
}

class PictureLine extends StatelessWidget {
  static const List<String> _pictures = [
    'assets/filip_happy.jpg',
    'assets/filip_normal.jpg',
    'assets/filip_unhappy.jpg',
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
