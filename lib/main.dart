import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> scoreKeeper = [];

QuizBrain quizBrain = QuizBrain();

class _MyAppState extends State<MyApp> {
  void checkAnswer(bool userPickedAnswer) {
    bool answerCheck = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        print("isFinished");
        Alert(
          context: context,
          title: "Finished!",
          desc: "You\'ve reached the end of the quiz.",
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      if (answerCheck == userPickedAnswer) {
        print('Right');
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        print('Wrong');
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizBrain.nextQuestion();
    });
  }

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
                                checkAnswer(true);
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
                                checkAnswer(false);
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
