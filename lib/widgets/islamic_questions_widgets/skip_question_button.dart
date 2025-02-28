import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_cubit.dart';

class SkipQuestionButton extends StatelessWidget {
  const SkipQuestionButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.4,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: () => context.read<QuizCubit>().nextQuestion(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade400,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.1, vertical: height * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
        ),
        child: Text(
          "تخطي",
          style: TextStyle(
            fontSize: width * 0.05,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
