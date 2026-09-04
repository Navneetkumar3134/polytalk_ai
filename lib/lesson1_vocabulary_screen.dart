import 'package:flutter/material.dart';

class Lesson1VocabularyScreen extends StatefulWidget {
  const Lesson1VocabularyScreen({super.key});

  @override
  State<Lesson1VocabularyScreen> createState() =>
      _Lesson1VocabularyScreenState();
}

class _Lesson1VocabularyScreenState
    extends State<Lesson1VocabularyScreen> {
  int questionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<LessonQuestion> questions = [
    LessonQuestion(
      type: 'Vocabulary',
      question: 'Someone says: "Nice to meet you." What can you say?',
      options: [
        'Nice to meet you too.',
        'I meet yesterday.',
        'Meeting is tomorrow.',
      ],
      correctAnswer: 0,
      explanation:
          '"Nice to meet you too" is a natural response when you meet someone.',
    ),
    LessonQuestion(
      type: 'Vocabulary',
      question: 'What does "free time" mean?',
      options: [
        'Time when you are not busy',
        'Time at school',
        'Time when you are sleeping',
      ],
      correctAnswer: 0,
      explanation:
          '"Free time" means time when you are not working, studying, or busy.',
    ),
    LessonQuestion(
      type: 'Grammar',
      question: 'Choose the correct sentence.',
      options: [
        'I am studying computer science.',
        'I studying computer science.',
        'I am study computer science.',
      ],
      correctAnswer: 0,
      explanation:
          'Use "am + studying" for an activity happening around the present time.',
    ),
    LessonQuestion(
      type: 'Grammar',
      question: 'Choose the natural question.',
      options: [
        'What do you do in your free time?',
        'What you do free time?',
        'What are you do in free time?',
      ],
      correctAnswer: 0,
      explanation:
          '"What do you do in your free time?" is the natural question.',
    ),
    LessonQuestion(
      type: 'Vocabulary',
      question: 'Which phrase helps keep a conversation going?',
      options: [
        'What about you?',
        'Yesterday.',
        'I finished.',
      ],
      correctAnswer: 0,
      explanation:
          '"What about you?" invites the other person to continue the conversation.',
    ),
  ];

  LessonQuestion get currentQuestion => questions[questionIndex];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == currentQuestion.correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showCompletionDialog();
    }
  }

  void showCompletionDialog() {
    final percentage =
        ((score / questions.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('🎉 Activity Complete!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'You completed Vocabulary & Grammar.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                '$score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Finish'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress =
        (questionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit 1 • Vocabulary & Grammar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${questionIndex + 1} of ${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Text(
                  currentQuestion.type,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                currentQuestion.question,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 25),

              ...List.generate(
                currentQuestion.options.length,
                (index) => _answerButton(index),
              ),

              if (answered) ...[
                const SizedBox(height: 15),
                _feedbackCard(),
              ],

              if (answered) ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: nextQuestion,
                    child: Text(
                      questionIndex <
                              questions.length - 1
                          ? 'Continue'
                          : 'Finish Activity',
                      style:
                          const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _answerButton(int index) {
    final isSelected = selectedAnswer == index;
    final isCorrect =
        index == currentQuestion.correctAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
        onPressed:
            answered ? null : () => selectAnswer(index),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              child: Text(
                String.fromCharCode(65 + index),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                currentQuestion.options[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            if (answered && isCorrect)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            if (answered && isSelected && !isCorrect)
              const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }

  Widget _feedbackCard() {
    final correct =
        selectedAnswer == currentQuestion.correctAnswer;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              correct
                  ? '✅ Correct'
                  : '❌ Not quite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: correct
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentQuestion.explanation,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonQuestion {
  final String type;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;

  const LessonQuestion({
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}