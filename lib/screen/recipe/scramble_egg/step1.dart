import 'package:flutter/material.dart';
//import 'package:cookeasy/services/progress_tracker.dart';


class ScrambleStep1 extends StatelessWidget {
 // final ProgressTrackerService _progressService = ProgressTrackerService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrambled Eggs - Step 1'),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      backgroundColor: Color(0xFFBCE7D6),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 1: Get an egg from the fridge',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(child: Image.asset('assets/images/pecs/take_egg.png')),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                 // await _progressService.logStepCompletion('scrambled_egg', 1);
                  Navigator.pushNamed(context, '/scramble_step2');
                },                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}