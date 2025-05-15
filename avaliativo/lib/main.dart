import 'package:flutter/material.dart';
import 'joke_service.dart';

void main() {
  runApp(JokeApp());
}

class JokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piadas',
      home: JokeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  String _joke = 'Clique no botão para ver uma piada!';

  void _loadJoke() async {
    try {
      final joke = await JokeService.getJoke();
      setState(() {
        _joke = joke;
      });
    } catch (e) {
      setState(() {
        _joke = 'Erro ao carregar piada.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Piadas em ingles')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_joke, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loadJoke,
                child: Text('Nova Piada'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}