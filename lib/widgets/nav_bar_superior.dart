import 'package:flutter/material.dart';

class NavBarSuperior extends StatelessWidget {
  //Barra superior pantalla inicio, fila con logo, programas, peliculas y milista.

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets_imgs/logoNetflix.png', width: size.width * 0.1),
        Text("Programas",
            style:
                TextStyle(color: Colors.white, fontSize: size.width * 0.042)),
        Text("Peliculas",
            style:
                TextStyle(color: Colors.white, fontSize: size.width * 0.042)),
        Text('Mi lista',
            style:
                TextStyle(color: Colors.white, fontSize: size.width * 0.042)),
      ],
    );
  }
}
