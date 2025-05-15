import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeService {
  static Future<String> getJoke() async { //metodo getJoke para acessar a API //assync nao executa dados imediatamente.
    final url = Uri.parse('https://v2.jokeapi.dev/joke/Any?type=single');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); //decodifica o objeto json
      return data['joke'] ?? 'Nenhuma piada encontrada';
    } else {
      throw Exception('Falha ao carregar piada');
    }
  }
}

// boas praticas
