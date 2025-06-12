import 'package:cookeasy/screen/lesson_plan/lesson_library_page.dart';
import 'package:cookeasy/screen/lesson_plan/lesson_plan_viewer.dart';
import 'package:flutter/material.dart';

// Hard Boiled Egg Screens
import 'package:cookeasy/screen/recipe/hard_boiled_egg/completion_page.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step1.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step2.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step3.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step4.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step5.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step6.dart';
import 'package:cookeasy/screen/recipe/hard_boiled_egg/step7.dart';

// Scramble Egg Screens
import 'package:cookeasy/screen/recipe/scramble_egg/completion_page.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step1.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step2.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step3.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step4.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step5.dart';
import 'package:cookeasy/screen/recipe/scramble_egg/step6.dart';

// Other Screens
import 'package:cookeasy/screen/recipe/recipe_selector.dart';
import 'package:cookeasy/screen/onboarding/onboarding_screen.dart';
import 'package:cookeasy/screen/auth/login_page.dart';
import 'package:cookeasy/screen/auth/signup_page.dart';
import 'package:cookeasy/screen/dashboard/dashboard_page.dart';
import 'package:cookeasy/screen/dashboard/settings_page.dart';

void main() {
  runApp(CookEasyApp());
}

class CookEasyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookEasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/settings': (context) => SettingsPage(),
        '/recipeSelector': (context) => RecipeSelector(),
        '/lessonPlan': (context) => LessonLibraryPage(), // ← Add this line

        // Scramble Egg Routes
        '/scramble_step1': (context) => ScrambleStep1(),
        '/scramble_step2': (context) => ScrambleStep2(),
        '/scramble_step3': (context) => ScrambleStep3(),
        '/scramble_step4': (context) => ScrambleStep4(),
        '/scramble_step5': (context) => ScrambleStep5(),
        '/scramble_step6': (context) => ScrambleStep6(),
        '/scramble_complete': (context) => ScrambleCompletionPage(),

        // Hard Boiled Egg Routes
        '/boiled_step1': (context) => BoiledStep1(),
        '/boiled_step2': (context) => BoiledStep2(),
        '/boiled_step3': (context) => BoiledStep3(),
        '/boiled_step4': (context) => BoiledStep4(),
        '/boiled_step5': (context) => BoiledStep5(),
        '/boiled_step6': (context) => BoiledStep6(),
        '/boiled_step7': (context) => BoiledStep7(),
        '/boiled_complete': (context) => HardBoiledCompletionPage(),
      },
    );
  }
}
