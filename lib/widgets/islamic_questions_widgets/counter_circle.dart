import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_states.dart';

class CounterCircle extends StatelessWidget {
  const CounterCircle({
    super.key,
    required this.width,
    required this.height,
    required this.state,
  });

  final double width;
  final double height;
  final QuizLoaded state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width * 0.2,
          height: height * 0.1,
          child: CircularProgressIndicator(
            value: state.timeLeft / 15,
            color: state.timeLeft > 3 ? Colors.green : Colors.red,
            strokeWidth: width * 0.02,
          ),
        ),
        Text(
          "${state.timeLeft}",
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
