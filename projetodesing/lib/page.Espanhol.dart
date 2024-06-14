import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.MenuLinguas.dart'; // Certifique-se de importar a página MenuLinguas

class EspanholPage extends StatefulWidget {
  @override
  _EspanholPageState createState() => _EspanholPageState();
}

class _EspanholPageState extends State<EspanholPage> {
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Traduza esta palavra para o Espanhol',
      'subQuestion': 'Brinquedo',
      'options': ['Listo', 'Cerca', 'Temprano', 'Juguete'],
      'correctAnswer': 'Juguete'
    },
    {
      'question': 'Traduza esta palavra para o Espanhol',
      'subQuestion': 'Cedo',
      'options': ['Listo', 'Cerca', 'Temprano', 'Juguete'],
      'correctAnswer': 'Temprano'
    },
    {
      'question': 'Traduza esta palavra para o Espanhol',
      'subQuestion': 'Pronto',
      'options': ['Listo', 'Cerca', 'Temprano', 'Juguete'],
      'correctAnswer': 'Listo'
    },
    {
      'question': 'Traduza esta palavra para o Espanhol',
      'subQuestion': 'Perto',
      'options': ['Listo', 'Cerca', 'Temprano', 'Juguete'],
      'correctAnswer': 'Cerca'
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('espanhol_concluido', true);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Parabéns!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                'assets/Certificado.png'), // Certifique-se de adicionar a imagem do certificado no diretório assets
            SizedBox(height: 20),
            Text('Você completou o teste de nível.'),
          ],
        ),
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
        title: Text('Resposta Incorreta'),
        content: Text('Por favor, tente novamente.'),
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
          Positioned(
            top: 50, // Ajuste a posição vertical conforme necessário
            left: 16,
            right: 16,
            child: Image.asset(
                'Espanhol.png'), // Certifique-se de adicionar a imagem no diretório assets
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100), // Ajuste o espaçamento conforme necessário
                  Text(
                    'ESPANHOL',
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
