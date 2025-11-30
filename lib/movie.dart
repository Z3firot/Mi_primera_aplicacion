class Movie {
  final String titulo;
  final String anio;
  final String director;
  final String genero;
  final String sinopsis;
  final String imagen;

  Movie({
    required this.titulo,
    required this.anio,
    required this.director,
    required this.genero,
    required this.sinopsis,
    required this.imagen,
  });
}

// Lista global de películas
List<Movie> peliculas = [
  Movie(
    titulo: "Inception",
    anio: "2010",
    director: "Christopher Nolan",
    genero: "Ciencia ficción",
    sinopsis: "Un ladrón que roba secretos a través de los sueños debe realizar la misión más difícil de su vida.",
    imagen: "inception.jpg",
  ),
  Movie(
    titulo: "Interstellar",
    anio: "2014",
    director: "Christopher Nolan",
    genero: "Ciencia ficción",
    sinopsis: "Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.",
    imagen: "interstellar.jpg",
  ),
];
