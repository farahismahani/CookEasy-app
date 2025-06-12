import 'package:cookeasy/screen/lesson_plan/lesson_plan_viewer.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('17:26', style: TextStyle(fontSize: 14)),
                    Row(
                      children: [
                        Icon(Icons.brightness_2, size: 18),
                        SizedBox(width: 10),
                        Icon(Icons.signal_cellular_4_bar, size: 18),
                        Icon(Icons.wifi, size: 18),
                        Icon(Icons.battery_full, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, size: 50, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                'Emily',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24),
              MenuCard(
                icon: Icons.receipt_long,
                label: '2 Recipes',
                onTap: () => Navigator.pushNamed(context, '/recipeSelector'),
              ),
              SizedBox(height: 12),
              MenuCard(
                icon: Icons.menu_book,
                label: 'Lesson Plan',
                onTap: () => Navigator.pushNamed(context, '/lessonPlan'),
              ),
              SizedBox(height: 12),
              MenuCard(
                icon: Icons.show_chart,
                label: 'Track Progress',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonPlanViewer(
                      title: 'Progress Summary',
                      filename: 'summary_checklist.pdf',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              MenuCard(
                icon: Icons.settings,
                label: 'Settings',
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              Spacer(),
              Image.asset(
                'assets/images/logout.png',
                height: 120,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBCE7D6),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const MenuCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            SizedBox(width: 16),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
