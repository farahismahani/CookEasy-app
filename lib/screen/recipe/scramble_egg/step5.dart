import 'package:flutter/material.dart';
//import 'package:cookeasy/services/progress_tracker.dart';

class ScrambleStep5 extends StatelessWidget {
  //final ProgressTrackerService _progressService = ProgressTrackerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrambled Eggs - Step 5'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      backgroundColor: Color(0xFFBCE7D6),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 5: Pour the egg into the pan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(child: Image.asset('assets/images/pecs/pour_eggs_in_pan.png')),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/scramble_step4');
                    },
                    child: Text('Previous'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      //await _progressService.logStepCompletion('scrambled_egg', 5);
                      Navigator.pushNamed(context, '/scramble_step6');
                    },
                    child: Text('Next'),
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
