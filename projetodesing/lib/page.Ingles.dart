import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.MenuLinguas.dart'; // Certifique-se de importar a página MenuLinguas

class InglesPage extends StatefulWidget {
  @override
  _InglesPageState createState() => _InglesPageState();
}

class _InglesPageState extends State<InglesPage> {
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Translate this word',
      'subQuestion': 'Ice cream',
      'options': ['Ice', 'Cream', 'Milk', 'Ice cream'],
      'correctAnswer': 'Ice cream'
    },
    {
      'question': 'Translate this word',
      'subQuestion': 'Sun',
      'options': ['Moon', 'Sun', 'Star', 'Sky'],
      'correctAnswer': 'Sun'
    },
    {
      'question': 'How do you say "Hello" in English?',
      'options': ['Hola', 'Bonjour', 'Hello', 'Ciao'],
      'correctAnswer': 'Hello'
    },
    {
      'question': 'Translate this word',
      'subQuestion': 'Heart',
      'options': ['Head', 'Heart', 'Hand', 'Foot'],
      'correctAnswer': 'Heart'
    },
  ];

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          _showCompletionDialog();
        }
      });
    } else {
      _showIncorrectAnswerDialog();
    }
  }

  Future<void> _showCompletionDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Congratulations!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.emoji_events, color: Colors.green, size: 50),
            SizedBox(height: 20),
            Text('You have completed the level test.'),
            SizedBox(height: 20),
            Text('Would you like to send the certificate by email?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showEmailConfirmationDialog(false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showEmailConfirmationDialog(true);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> _showEmailConfirmationDialog(bool emailSent) async {
    // Marcar o curso como concluído
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ingles_concluido', true);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(emailSent ? 'Action Confirmed' : 'Action Canceled'),
        content: Text(emailSent
            ? 'You have chosen to send the certificate by email.'
            : 'You have chosen not to send the certificate by email.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MenuLinguas()),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showIncorrectAnswerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Incorrect Answer'),
        content: Text('Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 94, 8, 233),
      body: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'New Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ENGLISH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (_questions[_currentQuestionIndex]
                      .containsKey('subQuestion'))
                    Text(
                      _questions[_currentQuestionIndex]['subQuestion'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 30),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3, // Diminui a altura dos quadrados
                    children: _questions[_currentQuestionIndex]['options']
                        .map<Widget>((option) {
                      return ElevatedButton(
                        onPressed: () => _checkAnswer(option),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 102),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            option,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white,
                    color: Color.fromARGB(255, 0, 0, 102),
                    minHeight: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}