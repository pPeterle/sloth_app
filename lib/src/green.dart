import 'dart:math';

import 'package:flutter/material.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class GreenPage extends StatefulWidget {
  @override
  _GreenPageState createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _rotation = _controller
        .drive(CurveTween(curve: Curves.easeOutCubic))
        .drive(Tween(begin: 0, end: 2 * pi));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.green,
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () => _controller.forward(from: 0),
            child: Text('ROTATE'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: AnimatedBuilder(
              animation: _rotation,
              child: ListView.builder(
                  itemExtent: 40,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 6),
                      child: Text('Item #$index'),
                    );
                  }),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotation.value,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
