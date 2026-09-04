import 'package:flutter/material.dart';
import 'unit1_screen.dart';

class EnglishB1HomeScreen extends StatelessWidget {
  const EnglishB1HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English • B1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🇬🇧 English',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'B1 • Intermediate',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Progress',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '0%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const LinearProgressIndicator(
                      value: 0,
                      minHeight: 8,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Start Learning',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(18),
                leading: const CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.play_arrow),
                ),
                title: const Text(
                  'Unit 1: Speak Naturally',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    'Build confidence in real conversations.',
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Unit1Screen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Course',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _courseItem(
              '1',
              'Speak Naturally',
              'Build confidence in real conversations',
              true,
            ),

            _courseItem(
              '2',
              'Build Your Vocabulary',
              'Useful everyday and academic vocabulary',
              true,
            ),

            _courseItem(
              '3',
              'Grammar for Speaking',
              'Use grammar naturally while communicating',
              false,
            ),

            _courseItem(
              '4',
              'Listening & Understanding',
              'Understand natural spoken English',
              false,
            ),

            _courseItem(
              '5',
              'Express Your Ideas',
              'Give opinions and explain your thoughts',
              false,
            ),

            _courseItem(
              '6',
              'Real-World Communication',
              'Travel, university and everyday situations',
              false,
            ),

            _courseItem(
              '7',
              'Storytelling',
              'Describe experiences and tell stories',
              false,
            ),

            _courseItem(
              '8',
              'Academic English',
              'Read, understand and discuss complex ideas',
              false,
            ),

            _courseItem(
              '9',
              'Writing Clearly',
              'Write structured and natural English',
              false,
            ),

            _courseItem(
              '10',
              'Advanced Conversation',
              'Handle longer and unexpected conversations',
              false,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _courseItem(
    String number,
    String title,
    String description,
    bool unlocked,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(number),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: Icon(
          unlocked
              ? Icons.arrow_forward_ios
              : Icons.lock,
        ),
      ),
    );
  }
}