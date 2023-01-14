import 'package:flutter/material.dart';
import 'widgets.dart';

/*
  Cabecera con imagen principal de pagina inicio,
   Categorias y fila con varios iconos y texto.
*/
class CartelPrincipal extends StatelessWidget {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[cabecera(), infoSerie(), botonera()],
    );
  }

  Widget cabecera() {
    return Stack(
      children: <Widget>[
        Image.network(
            'https://media.gq.com.mx/photos/61fa9f36c981b856e3697441/16:9/w_2560%2Cc_limit/netflix.jpg',
            height: size.height * 0.442,
            fit: BoxFit.fill),
        Container(
          width: double.infinity,
          height: size.height * 0.442,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black38, Colors.black87])),
        ),
        SafeArea(child: NavBarSuperior()),
      ],
    );
  }

  Widget infoSerie() {
    SizedBox esp = SizedBox(width: size.width * 0.013);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Telenovelesco",
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.03)),
        esp,
        Icon(Icons.fiber_manual_record,
            color: Colors.red, size: size.width * 0.01),
        esp,
        Text('suspenso insostenible',
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.03)),
        esp,
        Icon(Icons.fiber_manual_record,
            color: Colors.red, size: size.width * 0.01),
        esp,
        Text('de suspense',
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.03)),
        esp,
        Icon(Icons.fiber_manual_record,
            color: Colors.red, size: size.width * 0.01),
        esp,
        Text('adolescente',
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.03))
      ],
    );
  }

  Widget botonera() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: [
            const Icon(Icons.check, color: Colors.white),
            SizedBox(height: size.width * 0.01),
            Text(
              'Mi lista',
              style:
                  TextStyle(color: Colors.white, fontSize: size.width * 0.034),
            )
          ]),
          Container(
              color: Colors.white,
              width: size.width * 0.38,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  label: Text('Reproducir',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.039)))),
          Column(children: [
            const Icon(Icons.info_outline, color: Colors.white),
            SizedBox(height: size.width * 0.01),
            Text(
              'Información',
              style:
                  TextStyle(color: Colors.white, fontSize: size.width * 0.032),
            )
          ]),
        ],
      ),
    );
  }
}
