import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/result_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int index = 0;
  List<bool> jooptor = [];
  List<bool> rightAnswers = [];
  List<bool> wrongAnswers = [];

  void checkAnswer(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      rightAnswers.add(true);
    } else {
      jooptor.add(false);
      wrongAnswers.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тесттин жыйынтыгы!'),
              content: Text(
                'Суроолордун жалпы саны: ${jooptor.length} \n'
                'Туура жооптордун саны:${rightAnswers.length}\n'
                'Ката жооптордун саны: ${wrongAnswers.length}',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Тестти кайра баштоо'),
                  onPressed: () {
                    setState(() {
                      index = 0;
                      jooptor.clear();
                      rightAnswers.clear();
                      wrongAnswers.clear();
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ],
            );
          },
        );
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363636),
      appBar: AppBar(
        title: const Text(
          'Тапшырма 7',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 120,
              ),
              child: Text(
                textAlign: TextAlign.center,
                quizzes[index].question,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ),
            CustomButton(
              trueButton: true,
              onPressed: (value) {
                checkAnswer(value);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                trueButton: false,
                onPressed: (value) {
                  checkAnswer(value);
                }),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 80,
              child: ListView.builder(
                  itemCount: jooptor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return jooptor[index] == true
                        ? const ResultIcon(trueIcon: true)
                        : const ResultIcon(trueIcon: false);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
