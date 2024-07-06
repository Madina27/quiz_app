class QuizModel {
  QuizModel({required this.question, required this.answer});

  final String question;
  final bool answer;
}

final q1 = QuizModel(question: 'Кыргызстанда 7 область бар.', answer: true);
final q2 =
    QuizModel(question: 'Гарри Поттерди Джоан Роулинг жазган', answer: true);
final q3 = QuizModel(question: "Кыргызстандын борбору Нарын ", answer: false);
final q4 = QuizModel(question: "Бир жылда 360 кун бар", answer: false);
final q5 = QuizModel(question: "Машинанын 5 донгологу бар ", answer: false);
final q6 = QuizModel(question: "Flutter кроссплатформалык тил ", answer: true);
final q7 =
    QuizModel(question: "Dart яндекс тарабынан тузулгон ", answer: false);

List<QuizModel> quizzes = [q1, q2, q3, q4, q5, q6, q7];
