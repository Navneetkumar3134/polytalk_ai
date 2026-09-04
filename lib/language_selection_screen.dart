import 'package:flutter/material.dart';
import 'english_b1_home_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What do you want to learn?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Choose a language to start your learning journey.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView(
                children: [
                  _languageTile(
                    context,
                    '🇬🇧',
                    'English',
                    'Learn English',
                  ),
                  _languageTile(
                    context,
                    '🇩🇪',
                    'German',
                    'Learn German',
                  ),
                  _languageTile(
                    context,
                    '🇪🇸',
                    'Spanish',
                    'Learn Spanish',
                  ),
                  _languageTile(
                    context,
                    '🇫🇷',
                    'French',
                    'Learn French',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageTile(
    BuildContext context,
    String flag,
    String language,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        leading: Text(
          flag,
          style: const TextStyle(fontSize: 32),
        ),
        title: Text(
          language,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          if (language == 'English') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LevelSelectionScreen(
                  language: 'English',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class LevelSelectionScreen extends StatelessWidget {
  final String language;

  const LevelSelectionScreen({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$language Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your level',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Select the level that matches your current $language ability.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            _levelTile(
              context,
              'B1',
              'Intermediate',
              'I can communicate in everyday situations.',
            ),

            _levelTile(
              context,
              'B2',
              'Upper Intermediate',
              'I can discuss many topics comfortably.',
            ),

            _levelTile(
              context,
              'C1',
              'Advanced',
              'I can understand and communicate fluently.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _levelTile(
    BuildContext context,
    String level,
    String title,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Row(
          children: [
            Text(
              level,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(description),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          if (level == 'B1') {
            Navigator.push(
              context,
              MaterialPageRoute(
                 builder: (context) => const EnglishB1HomeScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}