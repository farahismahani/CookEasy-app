import 'package:flutter/material.dart';
import 'lesson_plan_viewer.dart';

class LessonLibraryPage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> sections = {
    '👩‍👧 Caregiver Materials': [
      {
        'title': 'Caregiver Guide',
        'file': 'caregiver_guide.pdf',
        'summary': 'Support guide for caregivers using CookEasy.'
      },
      {
        'title': 'Summary Checklist & Visual Strip Templates',
        'file': 'summary_checklist.pdf',
        'summary': 'PECS-style checklist and visual guide overview.'
      },
    ],
    '📚 Lesson Plans': [
      {
        'title': 'Lesson 1: What is Cooking?',
        'file': 'lesson1_what_is_cooking.pdf',
        'summary': 'Introduce the idea of cooking with visual tools.'
      },
      {
        'title': 'Lesson 2: Kitchen Tools Exploration',
        'file': 'lesson2_kitchen_tools.pdf',
        'summary': 'Teach basic kitchen tools with PECS visuals.'
      },
      {
        'title': 'Lesson 3: Food Safety Routine',
        'file': 'lesson3_food_safety.pdf',
        'summary': 'Introduce hand washing, danger signs, etc.'
      },
      {
        'title': 'Lesson 4: Cleaning Up Like a Chef',
        'file': 'lesson4_cleaning_up.pdf',
        'summary': 'Guide learners to clean up post-cooking.'
      },
    ],
    '🧩 Visual Reference Cards': [
      {
        'title': 'Kitchen Tools Lesson Card',
        'file': 'card_kitchen_tools.pdf',
        'summary': 'Visual cards for basic kitchen tools.'
      },
      {
        'title': 'Food Items Lesson Card',
        'file': 'card_food_items.pdf',
        'summary': 'Visual reference of common food ingredients.'
      },
      {
        'title': 'Hygiene & Safety Lesson Card',
        'file': 'card_hygiene_safety.pdf',
        'summary': 'Safety visuals like danger, hot, and clean.'
      },
      {
        'title': 'Sequencing Visual Lesson Card',
        'file': 'card_sequencing_visual.pdf',
        'summary': 'Step-by-step PECS visuals for cooking flow.'
      },
      {
        'title': 'Emotions Lesson Card',
        'file': 'card_emotions.pdf',
        'summary': 'Emotional expression cards for learner feedback.'
      },
      {
        'title': 'Actions Lesson Card',
        'file': 'card_actions.pdf',
        'summary': 'Action verbs like stir, crack, pour, etc.'
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        title: Text('Lesson Plan Library'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      body: ListView(
        children: sections.entries.expand((entry) {
          final sectionTitle = entry.key;
          final items = entry.value;
          return [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Row(
                children: [
                  Text(
                    sectionTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                ],
              ),
            ),
            ...items.map((lesson) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonPlanViewer(
                        title: lesson['title']!,
                        filename: lesson['file']!,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 28),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lesson['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              lesson['summary']!,
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ];
        }).toList(),
      ),
    );
  }
}
