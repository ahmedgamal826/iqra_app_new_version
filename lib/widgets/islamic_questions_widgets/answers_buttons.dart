import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_states.dart';

class AnswersButtons extends StatelessWidget {
  const AnswersButtons({
    super.key,
    required this.question,
    required this.height,
    required this.width,
    required this.state,
  });

  final Map<String, dynamic> question;
  final double height;
  final double width;
  final QuizLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question['options'].map<Widget>((option) {
        return GestureDetector(
          onTap: state.selectedAnswer == null
              ? () => context.read<QuizCubit>().checkAnswer(option)
              : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            padding: EdgeInsets.all(width * 0.03),
            width: double.infinity,
            decoration: BoxDecoration(
              color: state.selectedAnswer == null
                  ? Colors.grey[200]
                  : (option.trim() == question['correctAnswer'].trim()
                      ? Colors.green
                      : (option == state.selectedAnswer
                          ? Colors.red
                          : Colors.grey[200])),
              borderRadius: BorderRadius.circular(width * 0.03),
              border: Border.all(color: Colors.black, width: width * 0.002),
            ),
            child: Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
