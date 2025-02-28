import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_states.dart';
import 'package:iqra_app_new_version_22/widgets/islamic_questions_widgets/answers_buttons.dart';
import 'package:iqra_app_new_version_22/widgets/islamic_questions_widgets/counter_circle.dart';
import 'package:iqra_app_new_version_22/widgets/islamic_questions_widgets/custom_result_dialog.dart';
import 'package:iqra_app_new_version_22/widgets/islamic_questions_widgets/skip_question_button.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/error_connect_wifi_notification.dart';

class IslamicQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit()..fetchQuestions(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            "أسئلة دينية",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            } else if (state is QuizError) {
              return Center(
                child: Text(state.message,
                    style: const TextStyle(fontSize: 18, color: Colors.red)),
              );
            } else if (state is QuizFinished) {
              return _buildResult(context, state);
            } else if (state is QuizLoaded) {
              return _buildQuizContent(context, state);
            } else {
              return const ErrorNotification(message: 'حدث خطأ ما');
            }
          },
        ),
      ),
    );
  }

  // Widget _buildQuizContent(BuildContext context, QuizLoaded state) {
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;

  //   var question = state.questions[state.currentIndex];

  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //         horizontal: width * 0.05, vertical: height * 0.02),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         CounterCircle(
  //           width: width,
  //           height: height,
  //           state: state,
  //         ),
  //         SizedBox(height: height * 0.04),
  //         Image.asset(
  //           'assets/images/ideas.png',
  //           height: height * 0.15,
  //           width: width * 0.3,
  //           fit: BoxFit.cover,
  //         ),
  //         SizedBox(height: height * 0.02),
  //         Text(
  //           "السؤال رقم ${state.currentIndex + 1} من ${state.questions.length}",
  //           textAlign: TextAlign.right,
  //           style: TextStyle(
  //             fontSize: width * 0.05,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.green,
  //           ),
  //         ),
  //         SizedBox(height: height * 0.02),
  //         Text(
  //           question['question'],
  //           textAlign: TextAlign.center,
  //           style:
  //               TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(height: height * 0.03),
  //         AnswersButtons(
  //           question: question,
  //           height: height,
  //           width: width,
  //           state: state,
  //         ),
  //         const Spacer(),
  //         SkipQuestionButton(width: width, height: height),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildQuizContent(BuildContext context, QuizLoaded state) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var question = state.questions[state.currentIndex];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: Column(
        children: [
          CounterCircle(
            width: width,
            height: height,
            state: state,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ideas.png',
                    height: height * 0.15,
                    width: width * 0.3,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "السؤال رقم ${state.currentIndex + 1} من ${state.questions.length}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    question['question'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.03),
                  AnswersButtons(
                    question: question,
                    height: height,
                    width: width,
                    state: state,
                  ),
                ],
              ),
            ),
          ),
          SkipQuestionButton(width: width, height: height),
        ],
      ),
    );
  }

  Widget _buildResult(BuildContext context, QuizFinished state) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomResultDialog(
      width: width,
      height: height,
      state: state,
    );
  }
}
