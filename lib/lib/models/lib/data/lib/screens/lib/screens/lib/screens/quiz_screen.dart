import 'package:flutter/material.dart';
import '../models/chapter.dart';

class QuizScreen extends StatefulWidget {
  final Chapter chapter;
  const QuizScreen({super.key, required this.chapter});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQ = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "q": "What is the basic unit of life?",
      "options": ["Cell", "Atom", "Molecule", "Organ"],
      "answer": 0,
    },
    {
      "q": "Which part controls the cell?",
      "options": ["Cytoplasm", "Nucleus", "Membrane", "Vacuole"],
      "answer": 1,
    },
  ];

  void answer(int selected) {
    if (selected == questions[currentQ]["answer"]) {
      score++;
    }
    if (currentQ < questions.length - 1) {
      setState(() => currentQ++);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Quiz Complete"),
          content: Text("Score: $score / ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQ];
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question ${currentQ + 1}/${questions.length}"),
            const SizedBox(height: 12),
            Text(q["q"], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ...List.generate(q["options"].length, (i) {
              return Card(
                child: ListTile(
                  title: Text(q["options"][i]),
                  onTap: () => answer(i),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
