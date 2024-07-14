import 'package:flutter/material.dart';

class Notifications_app extends StatelessWidget {
  const Notifications_app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notifications'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text('Click')),
      ),
    );
  }
}
