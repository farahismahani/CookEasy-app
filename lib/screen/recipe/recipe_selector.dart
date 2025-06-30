import 'package:flutter/material.dart';

class RecipeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        backgroundColor: Color(0xFFBCE7D6),
        title: Text('Choose Your Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRecipeCard(
              context,
              title: 'Scrambled Eggs',
              imagePath: 'assets/images/competed-scrambled-egg.png',
              route: '/scramble_step1',
            ),
            SizedBox(height: 20),
            _buildRecipeCard(
              context,
              title: 'Hard Boiled Eggs',
              imagePath: 'assets/images/completed-hard-boiled-egg.png',
              route: '/boiled_step1',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
      BuildContext context, {
        required String title,
        required String imagePath,
        required String route,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFBCE7D6),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(imagePath, width: 70, height: 70),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
