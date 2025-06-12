import 'package:flutter/material.dart';
//import 'package:cookeasy/services/progress_tracker.dart';

class BoiledStep6 extends StatelessWidget {
  //final ProgressTrackerService _progressService = ProgressTrackerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boiled Eggs - Step 6'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      backgroundColor: Color(0xFFBCE7D6),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 6: Turn off stove',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/pecs/turn_off_stove.png'),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/boiled_step5');
                    },
                    child: Text('Previous'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      //await _progressService.logStepCompletion('hard_boiled_egg', 6);
                      Navigator.pushNamed(context, '/boiled_step7');
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
