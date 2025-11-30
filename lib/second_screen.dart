import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/api_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  final _directorController = TextEditingController();
  final _genreController = TextEditingController();
  final _synopsisController = TextEditingController();
  final _imageController = TextEditingController();

  final ApiService apiService = ApiService();

  bool isLoading = false;
  String? responseMessage;

  void _addMovie() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        responseMessage = null;
      });

      try {
        final result = await apiService.createMovie({
          "titulo": _titleController.text,
          "anio": _yearController.text,
          "director": _directorController.text,
          "genero": _genreController.text,
          "sinopsis": _synopsisController.text,
          "imagen": _imageController.text,
        });

        setState(() {
          responseMessage = "✅ Película agregada con ID: ${result['id']}";
        });
      } catch (e) {
        setState(() {
          responseMessage = "❌ Error: $e";
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _deleteMovie() async {
    // Aquí podrías implementar la lógica de eliminación
    // usando apiService.deleteMovie(id)
    setState(() {
      responseMessage = "🗑️ Película eliminada (ejemplo)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administración de películas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Ingresa un título" : null,
              ),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(labelText: "Año"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? "Ingresa el año" : null,
              ),
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(labelText: "Director"),
              ),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(labelText: "Género"),
              ),
              TextFormField(
                controller: _synopsisController,
                decoration: const InputDecoration(labelText: "Sinopsis"),
                maxLines: 3,
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: "URL de la imagen"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: isLoading ? null : _addMovie,
                icon: const Icon(Icons.add),
                label: isLoading
                    ? const Text("Agregando...")
                    : const Text("Agregar película"),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _deleteMovie,
                icon: const Icon(Icons.delete),
                label: const Text("Eliminar película"),
              ),
              const SizedBox(height: 20),
              if (responseMessage != null)
                Text(
                  responseMessage!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
