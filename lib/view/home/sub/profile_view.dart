import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.pink,
      child: Center(
        child: Text('### Profile Area'),
      ),
    );
  }
}
