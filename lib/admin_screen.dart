import 'package:flutter/material.dart';
import 'movie.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _anioController = TextEditingController();
  final _directorController = TextEditingController();
  final _generoController = TextEditingController();
  final _sinopsisController = TextEditingController();
  final _imagenController = TextEditingController();

  void _addMovie() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        peliculas.add(Movie(
          titulo: _tituloController.text,
          anio: _anioController.text,
          director: _directorController.text,
          genero: _generoController.text,
          sinopsis: _sinopsisController.text,
          imagen: _imagenController.text,
        ));
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Película agregada al catálogo")),
      );

      _formKey.currentState!.reset();
    }
  }

  void _deleteMovie(String titulo) {
    setState(() {
      peliculas.removeWhere((movie) => movie.titulo == titulo);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🗑️ Película '$titulo' eliminada")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administración de Películas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) => value!.isEmpty ? "Ingresa un título" : null,
              ),
              TextFormField(
                controller: _anioController,
                decoration: const InputDecoration(labelText: "Año"),
              ),
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(labelText: "Director"),
              ),
              TextFormField(
                controller: _generoController,
                decoration: const InputDecoration(labelText: "Género"),
              ),
              TextFormField(
                controller: _sinopsisController,
                decoration: const InputDecoration(labelText: "Sinopsis"),
                maxLines: 3,
              ),
              TextFormField(
                controller: _imagenController,
                decoration: const InputDecoration(labelText: "Ruta/URL de la imagen"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _addMovie,
                icon: const Icon(Icons.add),
                label: const Text("Agregar película"),
              ),
              const SizedBox(height: 20),
              const Text("Películas actuales:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...peliculas.map((movie) => ListTile(
                    title: Text(movie.titulo),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteMovie(movie.titulo),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
