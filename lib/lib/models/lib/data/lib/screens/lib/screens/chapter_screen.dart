import 'package:flutter/material.dart';
import '../models/chapter.dart';
import 'quiz_screen.dart';

class ChapterScreen extends StatelessWidget {
  final Chapter chapter;
  const ChapterScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notes", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(chapter.notes),
            const SizedBox(height: 16),
            Text("Important Terms", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...chapter.terms.map((t) => Chip(label: Text(t))),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(chapter: chapter),
                    ),
                  );
                },
                child: const Text("Start Quiz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
