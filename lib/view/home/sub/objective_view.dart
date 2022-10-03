import 'package:flutter/material.dart';

class ObjectiveView extends StatelessWidget {
  const ObjectiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.lightGreen,
      child: Center(
        child: Text('### Objective Area'),
      ),
    );
  }
}
