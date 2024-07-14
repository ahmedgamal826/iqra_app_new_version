import 'package:flutter/material.dart';

class CustomcircleAvatar extends StatefulWidget {
  const CustomcircleAvatar({super.key, required this.radius, this.onTab});

  final double radius;
  final VoidCallback? onTab;

  @override
  State<CustomcircleAvatar> createState() => _CustomcircleAvatarState();
}

class _CustomcircleAvatarState extends State<CustomcircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.brown,
      onTap: widget.onTab,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: widget.radius,
      ),
    );
  }
}
