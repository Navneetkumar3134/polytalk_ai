import 'package:flutter/material.dart';

class Lesson1Screen extends StatefulWidget {
  const Lesson1Screen({super.key});

  @override
  State<Lesson1Screen> createState() => _Lesson1ScreenState();
}

class _Lesson1ScreenState extends State<Lesson1Screen> {
  int sceneIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<StoryScene> scenes = [
    StoryScene(
      sceneNumber: 1,
      location: 'University cafeteria',
      character: 'Alex',
      dialogue:
          'Hey! I\'m Alex. Is this seat free? I think we\'re in the same class.',
      question: 'What would you say?',
      answers: [
        'Sure, have a seat.',
        'Yesterday I university.',
        'No, I am sitting.',
      ],
      correctAnswer: 0,
      explanation:
          '"Sure, have a seat" is a natural way to accept someone asking to sit with you.',
    ),
    StoryScene(
      sceneNumber: 2,
      location: 'University cafeteria',
      character: 'Alex',
      dialogue:
          'Thanks! Nice to meet you. Where are you from?',
      question: 'How would you answer naturally?',
      answers: [
        'I from India.',
        'I\'m from India. What about you?',
        'India yesterday.',
      ],
      correctAnswer: 1,
      explanation:
          'Adding "What about you?" keeps the conversation going instead of ending it after one answer.',
    ),
    StoryScene(
      sceneNumber: 3,
      location: 'Outside the classroom',
      character: 'Alex',
      dialogue:
          'That\'s interesting.i am from america. What are you studying?',
      question: 'Which response sounds natural?',
      answers: [
        'I\'m studying computer science.',
        'I studying computer science.',
        'Computer science study.',
      ],
      correctAnswer: 0,
      explanation:
          '"I\'m studying..." is the natural present continuous form for something you are currently studying.',
    ),
    StoryScene(
      sceneNumber: 4,
      location: 'Outside the classroom',
      character: 'Alex',
      dialogue:
          'Computer science? Nice! What made you choose it?',
      question: 'What is the best response?',
      answers: [
        'Because I like technology and solving problems.',
        'Yes, computer science.',
        'I choose yesterday.',
      ],
      correctAnswer: 0,
      explanation:
          'The question asks for a reason, so give a reason using "because".',
    ),
    StoryScene(
      sceneNumber: 5,
      location: 'University hallway',
      character: 'Alex',
      dialogue:
          'Cool. What do you usually do in your free time?',
      question: 'Keep the conversation going.',
      answers: [
        'I usually listen to music or watch movies. How about you?',
        'Free time is yesterday.',
        'I do.',
      ],
      correctAnswer: 0,
      explanation:
          'This answer gives information and asks Alex another question, creating a natural conversation.',
    ),
  ];

  StoryScene get currentScene => scenes[sceneIndex];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == currentScene.correctAnswer) {
        score++;
      }
    });
  }

  void nextScene() {
    if (sceneIndex < scenes.length - 1) {
      setState(() {
        sceneIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showCompletionDialog();
    }
  }

  void showCompletionDialog() {
    final percentage = ((score / scenes.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('🎉 Story Complete!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'You finished your first conversation story.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                '$score / ${scenes.length}',
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
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                percentage >= 70
                    ? 'Good job! You are ready for the next activity.'
                    : 'Keep practicing. You can try the story again.',
                textAlign: TextAlign.center,
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
    final progress = (sceneIndex + 1) / scenes.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit 1 • Speak Naturally'),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Scene ${currentScene.sceneNumber} of ${scenes.length}',
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

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '📍 ${currentScene.location}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Your Story',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'You are meeting someone new at university.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              currentScene.character[0],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            currentScene.character,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Text(
                        currentScene.dialogue,
                        style: const TextStyle(
                          fontSize: 19,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                currentScene.question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ...List.generate(
                currentScene.answers.length,
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
                    onPressed: nextScene,
                    child: Text(
                      sceneIndex < scenes.length - 1
                          ? 'Continue Story'
                          : 'Finish Story',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _answerButton(int index) {
    final isSelected = selectedAnswer == index;
    final isCorrect = index == currentScene.correctAnswer;

    Color? backgroundColor;

    if (answered) {
      if (isCorrect) {
        backgroundColor = Colors.white.withValues(alpha: 0.1);
      } else if (isSelected) {
        backgroundColor = Colors.white.withValues(alpha: 0.1);
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
        onPressed: answered ? null : () => selectAnswer(index),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          alignment: Alignment.centerLeft,
          backgroundColor: backgroundColor,
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
                currentScene.answers[index],
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
    final correct = selectedAnswer == currentScene.correctAnswer;

    return Card(
      color: correct
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.white.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              correct ? '✅ Natural response' : '❌ Not quite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: correct ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentScene.explanation,
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

class StoryScene {
  final int sceneNumber;
  final String location;
  final String character;
  final String dialogue;
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final String explanation;

  const StoryScene({
    required this.sceneNumber,
    required this.location,
    required this.character,
    required this.dialogue,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.explanation,
  });
}