import 'package:flutter/material.dart';
import '../providers/movies_provider.dart';
import '../widgets/widgets.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          CartelPrincipal(),
          Text("Seguir viendo", style: TextStyle(fontSize: size.height * 0.025)),
          ListaHorizontal(movies: moviesProvider.onDisplayMovies),
          Text("Preferidos de los fans", style: TextStyle(fontSize: size.height * 0.025)),
          ListaHorizontal(movies: moviesProvider.onDisplayPopulars),

        ],
      ),
      bottomNavigationBar: NavBarInferior(),
    );
  }


}
