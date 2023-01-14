import 'package:flutter/material.dart';

//Barra inferior pagina inicio, contiene fila con iconos y texto.
class NavBarInferior extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library_outlined), label: 'Proximamente'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_downward), label: 'Descargas'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mas'),
        ]);
  }
}
