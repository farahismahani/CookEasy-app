import 'package:flutter/material.dart';

class LessonPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        title: Text('Lesson Plan'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              '👩‍🍳 What You’ll Be Doing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'You’ll guide your learner through a cooking task using picture cards. These cards move across 3 steps to show progress.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Image.asset('assets/images/kanban/kanban_board.png'),
            SizedBox(height: 12),
            _sectionCard(
              title: '📍 TO DO',
              desc: 'All the steps start here. This is where you begin.',
            ),
            _sectionCard(
              title: '🔄 DOING',
              desc: 'Move the task here when your learner starts doing it.',
            ),
            _sectionCard(
              title: '✅ DONE',
              desc: 'When finished, move the card here and celebrate progress!',
            ),
            SizedBox(height: 24),
            Text(
              '✅ Tips to Help',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _bullet('Use real photos to make things easier to understand.'),
            _bullet('Repeat activities to help learners build confidence.'),
            _bullet('Be encouraging: smiles, thumbs-up, praise.'),
            _bullet('Keep it fun and consistent each time you do it.'),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/pecsBoard'),
              icon: Icon(Icons.play_arrow),
              label: Text("Start PECS Board"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCE7D6),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: TextStyle(fontSize: 16),
              ),
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
