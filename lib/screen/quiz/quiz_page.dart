import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final Map<String, String> optionImages;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.optionImages,
  });
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: "These are the ingredients to make scrambled egg except:",
      options: ["Eggs", "Milk", "Salt", "Brown Rice"],
      correctAnswer: "Brown Rice",
      optionImages: {
        "Eggs": "assets/images/quiz/eggs.png",
        "Milk": "assets/images/quiz/milk.png",
        "Salt": "assets/images/quiz/salt.png",
        "Brown Rice": "assets/images/quiz/brown_rice.png",
      },
    ),
    QuizQuestion(
      question: "What can be added to make scrambled eggs creamier?",
      options: ["Cream", "Milk", "Water"],
      correctAnswer: "Cream",
      optionImages: {
        "Cream": "assets/images/quiz/cream.png",
        "Milk": "assets/images/quiz/milk.png",
        "Water": "assets/images/quiz/water.png",
      },
    ),
    QuizQuestion(
      question: "Which one is NOT a kitchen tool?",
      options: ["Whisk", "Pan", "Pillow", "Spatula"],
      correctAnswer: "Pillow",
      optionImages: {
        "Whisk": "assets/images/quiz/whisk.png",
        "Pan": "assets/images/quiz/frying_pan.png",
        "Pillow": "assets/images/quiz/pillow.png",
        "Spatula": "assets/images/quiz/spatula.png",
      },
    ),
    QuizQuestion(
      question: "What should you use to crack an egg?",
      options: ["Bowl edge", "Knife", "Cup", "Ladle"],
      correctAnswer: "Bowl edge",
      optionImages: {
        "Bowl edge": "assets/images/quiz/bowl_edge.png",
        "Knife": "assets/images/quiz/knife.png",
        "Cup": "assets/images/quiz/cup.png",
        "Ladle": "assets/images/quiz/ladle.png",
      },
    ),
    QuizQuestion(
      question: "Which item is used for cooking, not eating?",
      options: ["Fork", "Plate", "Frying pan", "Spoon"],
      correctAnswer: "Frying pan",
      optionImages: {
        "Fork": "assets/images/quiz/fork.png",
        "Plate": "assets/images/quiz/plate.png",
        "Frying pan": "assets/images/quiz/frying_pan.png",
        "Spoon": "assets/images/quiz/spoon.png",
      },
    ),
    QuizQuestion(
      question: "What do you turn ON to cook eggs?",
      options: ["Stove", "Fridge", "Microwave", "Oven mitt"],
      correctAnswer: "Stove",
      optionImages: {
        "Stove": "assets/images/quiz/stove.png",
        "Fridge": "assets/images/quiz/fridge.png",
        "Microwave": "assets/images/quiz/microwave.png",
        "Oven mitt": "assets/images/quiz/oven_mitt.png",
      },
    ),
  ];

  int currentIndex = 0;
  String? selectedOption;
  String? feedback;
  int score = 0;

  void checkAnswer(String option) {
    final correct = questions[currentIndex].correctAnswer;
    setState(() {
      selectedOption = option;
      feedback = option == correct ? "Correct!" : "Oops!";
      if (option == correct) score++;
    });
  }

  void nextQuestion() {
    if (currentIndex + 1 < questions.length) {
      setState(() {
        currentIndex++;
        selectedOption = null;
        feedback = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Quiz Completed"),
          content: Text("You scored $score out of ${questions.length}!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/dashboard',
                      (Route<dynamic> route) => false,
                );
              },
              child: Text("Back to Dashboard"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        title: Text("Kitchen Quiz"),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              backgroundColor: Colors.grey[300],
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/chef-hat-1.png', height: 100),
            SizedBox(height: 20),
            Text(
              q.question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...q.options.map((opt) {
              final isCorrect = opt == q.correctAnswer;
              final isSelected = opt == selectedOption;

              Color? bgColor;
              if (selectedOption != null) {
                if (isCorrect) {
                  bgColor = Colors.green[300];
                } else if (isSelected) {
                  bgColor = Colors.red[300];
                }
              }

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedOption == null ? () => checkAnswer(opt) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor ?? Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        q.optionImages[opt]!,
                        height: 40,
                        width: 40,
                        errorBuilder: (_, __, ___) => SizedBox(width: 40),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(opt, style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              );
            }),
            if (feedback != null) ...[
              SizedBox(height: 20),
              Text(
                feedback!,
                style: TextStyle(
                  fontSize: 18,
                  color: feedback == "Correct!" ? Colors.green : Colors.red,
                ),
              ),
            ],
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: selectedOption != null ? nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBCE7D6),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    currentIndex == questions.length - 1 ? "Finish" : "Next",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
