import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:iqra_app_new_version_22/cubit/islamic_question%20cubit/questions_states.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  List<Map<String, dynamic>> questions = [];
  int currentIndex = 0;
  int score = 0;
  int timeLeft = 10;
  Timer? timer;
  String? selectedAnswer;

  void fetchQuestions() async {
    emit(QuizLoading());

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('islamicQuestions').get();

      questions = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      if (questions.isNotEmpty) {
        questions.shuffle();
        emit(QuizLoaded(questions, currentIndex, score, timeLeft, null));
        startTimer();
      } else {
        emit(QuizError("لا توجد أسئلة متاحة"));
      }
    } catch (e) {
      emit(QuizError("حدث خطأ أثناء تحميل الأسئلة"));
    }
  }

  void startTimer() {
    timer?.cancel();
    timeLeft = 15;
    emit(QuizLoaded(questions, currentIndex, score, timeLeft, selectedAnswer));

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
        emit(QuizLoaded(
            questions, currentIndex, score, timeLeft, selectedAnswer));
      } else {
        timer.cancel();
        nextQuestion();
      }
    });
  }

  void checkAnswer(String answer) {
    bool isCorrect =
        answer.trim() == questions[currentIndex]['correctAnswer'].trim();

    selectedAnswer = answer;
    if (isCorrect) {
      score++;
    }

    emit(QuizLoaded(questions, currentIndex, score, timeLeft, selectedAnswer));

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      selectedAnswer = null;
      emit(
        QuizLoaded(
          questions,
          currentIndex,
          score,
          timeLeft,
          selectedAnswer,
        ),
      );
      startTimer();
    } else {
      timer?.cancel();
      emit(QuizFinished(score, questions.length));
    }
  }

  void restartQuiz() {
    currentIndex = 0;
    score = 0;
    selectedAnswer = null;
    emit(
      QuizLoaded(
        questions,
        currentIndex,
        score,
        timeLeft,
        selectedAnswer,
      ),
    );
    startTimer();
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
