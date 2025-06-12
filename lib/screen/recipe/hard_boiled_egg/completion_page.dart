import 'package:flutter/material.dart';
//import 'package:cookeasy/services/progress_tracker.dart';

class HardBoiledCompletionPage extends StatelessWidget {
  //final ProgressTrackerService _progressService = ProgressTrackerService();

  final List<Map<String, String>> emotions = [
    {
      'label': 'I am Happy',
      'value': 'happy',
      'image': 'assets/images/pecs/i_am_happy.png'
    },
    {
      'label': 'I am Confused',
      'value': 'confused',
      'image': 'assets/images/pecs/i_am_confused.png'
    },
    {
      'label': 'I am Tired',
      'value': 'tired',
      'image': 'assets/images/pecs/i_am_tired.png'
    },
    {
      'label': 'I am Excited',
      'value': 'excited',
      'image': 'assets/images/pecs/i_am_excited.png'
    },
  ];

  void _submitFeeling(BuildContext context, String feelingLabel) async {
    final selectedEmotion = emotions.firstWhere(
          (e) => e['label'] == feelingLabel,
      orElse: () => {'value': 'unknown'},
    )['value'];

   // await _progressService.logStepCompletion('hard_boiled_egg', 100, emotion: selectedEmotion);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hard-boiled egg - 100% done, user feeling $feelingLabel!')),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
    });
  }

  void _goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60),
                Image.asset(
                  'assets/images/completed-hard-boiled-egg.png',
                  height: 180,
                ),
                SizedBox(height: 30),
                Text(
                  'Hard-Boiled Egg is Ready!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Text(
                  "How do you feel?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: emotions.map((emotion) {
                    return GestureDetector(
                      onTap: () => _submitFeeling(context, emotion['label']!),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(emotion['image']!, height: 80),
                              SizedBox(height: 8),
                              Text(
                                emotion['label']!,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => _goHome(context),
                  icon: Icon(Icons.home),
                  label: Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Color(0xFFBCE7D6),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
