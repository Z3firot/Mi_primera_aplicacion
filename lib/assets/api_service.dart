import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Map<String, dynamic>> fetchPost(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/posts/$id"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Error al cargar el post");
    }
  }

  Future<Map<String, dynamic>> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse("$baseUrl/posts"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"title": title, "body": body, "userId": 1}),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception("Error al crear el post");
    }
  }
}
