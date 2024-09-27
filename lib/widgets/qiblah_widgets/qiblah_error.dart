import 'package:flutter/material.dart';

class QiblahError extends StatelessWidget {
  const QiblahError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        centerTitle: true,
        title: const Text(
          'القبلة',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/qibla_icon.png',
              width: 45,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.brown,
      body: const Center(
        child: Text(
          textAlign: TextAlign.center,
          'يرجي تفعيل الموقع الجغرافي لتحديد القبلة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
