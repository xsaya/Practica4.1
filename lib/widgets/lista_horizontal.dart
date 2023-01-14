import 'package:flutter/material.dart';
import '../models/movie.dart';

/*
Fila peliculas, utiliza api movies, recorremos la lista movies con
itemBuilder dentro de nuestro ListView con el metodo.builder
*/

class ListaHorizontal extends StatelessWidget {
  final List<Movie> movies;

  const ListaHorizontal({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.008)),
        SizedBox(
          height: size.width * 0.30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterPath),
                    fit: BoxFit.cover);
              }),
        ),
        SizedBox(height: size.height * 0.01)
      ],
    );
  }
}
