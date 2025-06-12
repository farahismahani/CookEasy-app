import 'package:flutter/material.dart';
//import 'package:cookeasy/services/progress_tracker.dart';

class ScrambleStep6 extends StatelessWidget {
 // final ProgressTrackerService _progressService = ProgressTrackerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrambled Eggs - Step 6'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      backgroundColor: Color(0xFFBCE7D6),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 6: Stir the egg until cooked',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(child: Image.asset('assets/images/pecs/stir_eggs.png')),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/scramble_step5');
                    },
                    child: Text('Previous'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                   //   await _progressService.logStepCompletion('scrambled_egg', 5);
                      Navigator.pushNamed(context, '/scramble_complete');
                    },
                    child: Text('Finish'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
