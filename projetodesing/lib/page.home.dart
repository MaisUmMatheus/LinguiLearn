import 'package:flutter/material.dart';
import 'package:projetodesing/page.cadastro.dart';
import 'package:projetodesing/page.curso.dart';
import 'dart:async';
import 'package:projetodesing/page.login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentPageIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex < 3) {
        setState(() {
          _currentPageIndex++;
        });
      } else {
        setState(() {
          _currentPageIndex = 0;
        });
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 140, right: 40, left: 40),
        color: Color.fromARGB(255, 94, 8, 233),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'New',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'LinguiLearn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre o texto e a imagem
                SizedBox(
                  height: 256,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      Image.asset("moocas2.png"),
                      Image.asset("Loquinhos.png"),
                      Image.asset("pessoal.png"),
                      Image.asset("cara.png"),
                    ],
                  ),
                ),
                SizedBox(height: 60), // Espaçamento entre a imagem e os botões
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 3, 131),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CursoPage()),
                          );
                        },
                        child: Text('Nosso Curso'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroPage()),
                          );
                        },
                        child: Text('Cadastrar-se'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginOficialPage()),
                          );
                        },
                        child: Text('Login'),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(300, 60),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
