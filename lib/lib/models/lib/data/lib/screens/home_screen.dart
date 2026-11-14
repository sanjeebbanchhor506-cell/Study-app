import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import 'chapter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Study App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleChapters.length,
        itemBuilder: (context, i) {
          final ch = sampleChapters[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(ch.subject[0]),
              ),
              title: Text(ch.name),
              subtitle: Text("Class ${ch.classNo} • ${ch.subject}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChapterScreen(chapter: ch),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
