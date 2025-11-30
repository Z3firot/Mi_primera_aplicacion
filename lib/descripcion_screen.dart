import 'package:flutter/material.dart';

class DescripcionScreen extends StatelessWidget {
  final String titulo;
  final String anio;
  final String director;
  final String genero;
  final String sinopsis;
  final String imagen;

  const DescripcionScreen({
    super.key,
    required this.titulo,
    required this.anio,
    required this.director,
    required this.genero,
    required this.sinopsis,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(imagen, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text("Título: $titulo", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Año: $anio"),
            Text("Director: $director"),
            Text("Género: $genero"),
            const SizedBox(height: 10),
            Text("Sinopsis:", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(sinopsis),
          ],
        ),
      ),
    );
  }
}
