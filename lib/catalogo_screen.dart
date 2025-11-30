import 'package:flutter/material.dart';
import 'movie.dart';
import 'descripcion_screen.dart';
import 'admin_screen.dart'; // Importamos la pantalla de administración

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Películas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // Ícono de engranaje
            tooltip: "Administrar catálogo",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          final pelicula = peliculas[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(pelicula.imagen, width: 50, fit: BoxFit.cover),
              title: Text(pelicula.titulo),
              subtitle: Text(pelicula.anio),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescripcionScreen(
                      titulo: pelicula.titulo,
                      anio: pelicula.anio,
                      director: pelicula.director,
                      genero: pelicula.genero,
                      sinopsis: pelicula.sinopsis,
                      imagen: pelicula.imagen,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
