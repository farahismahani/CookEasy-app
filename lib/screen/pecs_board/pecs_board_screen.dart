import 'package:flutter/material.dart';
import 'task_card.dart';
import 'task_data.dart';

class PecsBoardScreen extends StatefulWidget {
  @override
  State<PecsBoardScreen> createState() => _PecsBoardScreenState();
}

class _PecsBoardScreenState extends State<PecsBoardScreen> {
  String selectedLesson = 'Scrambled Egg';

  List<TaskCard> get currentSteps {
    return selectedLesson == 'Scrambled Egg'
        ? scrambledEggSteps
        : hardboiledEggSteps;
  }

  late List<TaskCard> toDo;
  List<TaskCard> doing = [];
  List<TaskCard> done = [];

  @override
  void initState() {
    super.initState();
    toDo = List.from(currentSteps);
  }

  void resetBoard() {
    setState(() {
      toDo = List.from(currentSteps);
      doing.clear();
      done.clear();
    });
  }

  void moveTask(TaskCard task, List<TaskCard> from, List<TaskCard> to) {
    setState(() {
      from.remove(task);
      to.add(task);
    });
  }

  Widget buildColumn(String title, List<TaskCard> tasks, Function(TaskCard) onTap) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              children: tasks.map((task) {
                return GestureDetector(
                  onTap: () => onTap(task),
                  child: TaskCardWidget(task: task),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRewardStars() {
    int total = currentSteps.length;
    int completed = done.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Icon(
          index < completed ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 28,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      appBar: AppBar(
        title: Text('$selectedLesson Lesson'),
        backgroundColor: Color(0xFFBCE7D6),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: selectedLesson,
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.black,
              underline: SizedBox(),
              items: ['Scrambled Egg', 'Hardboiled Egg'].map((lesson) {
                return DropdownMenuItem(
                  value: lesson,
                  child: Text(lesson),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null && value != selectedLesson) {
                  setState(() {
                    selectedLesson = value;
                    resetBoard();
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: buildColumn('To Do', toDo, (task) => moveTask(task, toDo, doing)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: buildColumn('Doing', doing, (task) => moveTask(task, doing, done)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: buildColumn('Done', done, (_) {}),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                buildRewardStars(),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: done.length == currentSteps.length
                      ? () => Navigator.pushReplacementNamed(context, '/lessonCompleted')
                      : null,
                  icon: Icon(Icons.check),
                  label: Text("Finish Lesson"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBCE7D6),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
