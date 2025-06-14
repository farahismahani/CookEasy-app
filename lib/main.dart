import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // auto-generated

// Authentication
import 'package:cookeasy/screen/auth/login_page.dart';
import 'package:cookeasy/screen/auth/signup_page.dart';

// Dashboard & Settings
import 'package:cookeasy/screen/dashboard/dashboard_page.dart';
import 'package:cookeasy/screen/dashboard/settings_page.dart';

// Onboarding
import 'package:cookeasy/screen/onboarding/onboarding_screen.dart';

// Recipe Selector
import 'package:cookeasy/screen/recipe/recipe_selector.dart';

// Lesson Plan
import 'package:cookeasy/screen/lesson_plan/lesson_library_page.dart';
import 'package:cookeasy/screen/lesson_plan/lesson_plan_viewer.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CookEasyApp());
}

class CookEasyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookEasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFEEFE2),
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFBCE7D6),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFBCE7D6),
            foregroundColor: Colors.black,
            textStyle: TextStyle(fontSize: 16),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),

      // 🔁 Toggle between '/' and '/login' if needed
      initialRoute: '/',

      routes: {
        // General Navigation
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/settings': (context) => SettingsPage(),
        '/recipeSelector': (context) => RecipeSelector(),
        '/lessonPlan': (context) => LessonLibraryPage(),

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

      // Optional: fallback route for unknown paths
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found: ${settings.name}')),
          ),
        );
      },
    );
  }
}
