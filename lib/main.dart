import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> scoreKeeper = [
  const Icon(
    Icons.check,
    color: Colors.green,
  ),
  const Icon(
    Icons.close,
    color: Colors.red,
  ),
];

QuizBrain quizBrain = QuizBrain();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () {
                                bool answerCheck =
                                    quizBrain.getQuestionAnswer();
                                if (answerCheck == true) {
                                  print('Right');
                                } else {
                                  print('Wrong');
                                }
                                setState(() {
                                  quizBrain.nextQuestion();

                                  scoreKeeper.add(
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                  );
                                });
                              },
                              child: const Text(
                                'True',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            color: Colors.red,
                            child: TextButton(
                              onPressed: () {
                                bool answerCheck =
                                    quizBrain.getQuestionAnswer();
                                if (answerCheck == false) {
                                  print('Right');
                                } else {
                                  print('Wrong');
                                }
                                setState(() {
                                  quizBrain.nextQuestion();
                                  scoreKeeper.add(
                                    const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  );
                                });
                              },
                              child: const Text(
                                'False',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: scoreKeeper,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
