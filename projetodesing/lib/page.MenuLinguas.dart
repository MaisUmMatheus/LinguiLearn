import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.Ingles.dart';
import 'page.Espanhol.dart';
import 'page.Frances.dart';
import 'page.Italiano.dart';

class MenuLinguas extends StatefulWidget {
  @override
  _MenuLinguasState createState() => _MenuLinguasState();
}

class _MenuLinguasState extends State<MenuLinguas>
    with SingleTickerProviderStateMixin {
  bool _inglesConcluido = false;
  bool _espanholConcluido = false;
  bool _francesConcluido = false;
  bool _italianoConcluido = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _checkCourseCompletion();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = _controller.drive(
      ColorTween(
        begin: Colors.red,
        end: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkCourseCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _inglesConcluido = prefs.getBool('ingles_concluido') ?? false;
      _espanholConcluido = prefs.getBool('espanhol_concluido') ?? false;
      _francesConcluido = prefs.getBool('frances_concluido') ?? false;
      _italianoConcluido = prefs.getBool('italiano_concluido') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool allCoursesCompleted = _inglesConcluido &&
        _espanholConcluido &&
        _francesConcluido &&
        _italianoConcluido;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 94, 8, 233),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (allCoursesCompleted)
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    'Parabéns pela conclusão do curso LinguiLearn!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _colorAnimation.value,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            if (allCoursesCompleted) SizedBox(height: 20),
            Text(
              'LinguiLearn',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Escolha qual língua você gostaria de testar o seu nível',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _inglesConcluido
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InglesPage()),
                      );
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 94, 8, 233),
                backgroundColor: _inglesConcluido ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inglês',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_inglesConcluido)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _espanholConcluido
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EspanholPage()),
                      );
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 94, 8, 233),
                backgroundColor:
                    _espanholConcluido ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Espanhol',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_espanholConcluido)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _francesConcluido
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FrancesPage()),
                      );
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 94, 8, 233),
                backgroundColor: _francesConcluido ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Francês',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_francesConcluido)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _italianoConcluido
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItalianoPage()),
                      );
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 94, 8, 233),
                backgroundColor:
                    _italianoConcluido ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Italiano',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_italianoConcluido)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
