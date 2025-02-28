abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Map<String, dynamic>> questions;
  final int currentIndex;
  final int score;
  final int timeLeft;
  final String? selectedAnswer;

  QuizLoaded(this.questions, this.currentIndex, this.score, this.timeLeft,
      this.selectedAnswer);
}

class QuizFinished extends QuizState {
  final int score;
  final int totalQuestions;

  QuizFinished(this.score, this.totalQuestions);
}

class QuizError extends QuizState {
  final String message;

  QuizError(this.message);
}
