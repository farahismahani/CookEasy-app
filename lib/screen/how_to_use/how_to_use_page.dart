import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        title: Text("How to Use"),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              '👩‍🍳 How This Works',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'This module guides you and your learner through step-by-step cooking tasks using a Kanban-style layout. Each task card can be moved from “To Do” ➡ “Doing” ➡ “Done”.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Image.asset('assets/images/kanban/frame_todo.png'),
            SizedBox(height: 12),
            _sectionCard(
              title: '📍 TO DO',
              desc: 'All task cards start here. Begin each session by placing every task in this column.',
            ),
            _sectionCard(
              title: '🔄 DOING',
              desc: 'As your learner starts a task, tap the card to move it here. Only keep 1 task at a time.',
            ),
            _sectionCard(
              title: '✅ DONE',
              desc: 'Once a task is finished, move it here and give encouragement or place a reward sticker.',
            ),
            SizedBox(height: 24),
            Text(
              '🎯 Tips for Success',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _bullet('Use real photos of your kitchen tools to improve recognition.'),
            _bullet('Keep routines consistent — same time, place, and cards.'),
            _bullet('Celebrate every little achievement. Thumbs-up, high-five, smiles!'),
            _bullet('Repeat activities regularly. Familiarity builds independence.'),
            SizedBox(height: 24),
            Text(
              '💡 You can find this system under "PECS Board" in your dashboard!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required String desc}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(desc),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
