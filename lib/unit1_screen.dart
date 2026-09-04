import 'package:flutter/material.dart';
import 'lesson1_screen.dart';

class Unit1Screen extends StatelessWidget {
  const Unit1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Speak Naturally',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Complete each step to build real conversation skills.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            _step(
              context,
              number: '1',
              title: 'Learn',
              description: 'Understand natural introductions.',
              icon: Icons.school,
              unlocked: true,
            ),

            _line(),

            _step(
              context,
              number: '2',
              title: 'Vocabulary & Grammar',
              description: 'Build the language you need.',
              icon: Icons.menu_book,
              unlocked: false,
            ),

            _line(),

            _step(
              context,
              number: '3',
              title: 'Listening',
              description: 'Understand natural spoken English.',
              icon: Icons.headphones,
              unlocked: false,
            ),

            _line(),

            _step(
              context,
              number: '4',
              title: 'Speaking',
              description: 'Practice answering out loud.',
              icon: Icons.mic,
              unlocked: false,
            ),

            _line(),

            _step(
              context,
              number: '5',
              title: 'AI Conversation',
              description: 'Have a real conversation with PolyTalk AI.',
              icon: Icons.smart_toy,
              unlocked: false,
            ),

            const SizedBox(height: 30),

            const Text(
              'Complete the steps in order',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
    required IconData icon,
    required bool unlocked,
  }) {
    return Card(
      elevation: unlocked ? 2 : 0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: CircleAvatar(
          radius: 27,
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        title: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(description),
        ),

        trailing: Icon(
          unlocked
              ? Icons.arrow_forward_ios
              : Icons.lock,
        ),

        onTap: unlocked
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Lesson1Screen(),
                  ),
                );
              }
            : null,
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 3,
      height: 25,
      color: Colors.grey.shade300,
    );
  }
}