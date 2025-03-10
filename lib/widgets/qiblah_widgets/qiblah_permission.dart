import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblahPermission extends StatefulWidget {
  QiblahPermission({super.key});

  @override
  State<QiblahPermission> createState() => _QiblahPermissionState();
}

class _QiblahPermissionState extends State<QiblahPermission>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;

  AnimationController? _animationController;

  double begin = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        backgroundColor: Colors.green,
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
      body: StreamBuilder<QiblahDirection>(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          if (snapshot.hasData) {
            final qiblahDirection = snapshot.data!;
            final newBegin = qiblahDirection.qiblah * (pi / 180) * -1;

            animation = Tween(begin: begin, end: newBegin)
                .animate(_animationController!);
            begin = newBegin;

            _animationController!.forward(from: 0);
            double screenHeight = MediaQuery.of(context).size.height;
            return Center(
              child: ListView(
                children: [
                  SizedBox(height: screenHeight * 0.15),
                  Text(
                    textAlign: TextAlign.center,
                    "${qiblahDirection.direction.toInt()}°",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: screenHeight * 0.09),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: Image.asset(
                          'assets/images/qibla_image.jpg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Error retrieving Qiblah direction.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
