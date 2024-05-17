import 'package:flutter/material.dart';

class CursoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 94, 8, 233), // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: Color.fromARGB(100, 94, 8, 233),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Color.fromARGB(255, 94, 8, 233),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'New',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'LinguiLearn',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: 300, // Aumente a altura
                      width: 350, // Aumente a largura
                      child: Image.asset("Livros.png"),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Nosso curso',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                      height: 20), // Espaçamento entre o título e o contêiner
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 22, 3, 131),
                      borderRadius: BorderRadius.circular(
                          15.0), // Raio dos cantos arredondados
                    ),
                    child: Text(
                      'Bem-vindo à nossa escola, fundada em 2024 com o propósito de tornar o aprendizado de idiomas uma experiência rápida e gratificante. Oferecemos cursos de inglês, espanhol, italiano e francês, utilizando métodos inovadores para facilitar o processo de aprendizagem. Junte-se a nós e descubra como é possível dominar um novo idioma de forma eficiente e divertida!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // Cor do texto
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
