import 'package:flutter/material.dart';

import '../preferences/preferences.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _user = Preferences.name, _pass = Preferences.password;

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading:
            Image.asset('assets_imgs/logoNetflix.png', width: size.width * 1),
        title: Text(
          'Bienvenido ',
          style: TextStyle(fontSize: size.width * 0.08),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets_imgs/fondo.png'),
            fit: BoxFit.cover,
            opacity: 150.0,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.10, vertical: size.height * 0.26),
          children: [
            _Usuario(),
            Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02)),
            _Password(),
            _recordarUsuario(),
            Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.06)),
            _inicioSesion()
          ],
        ),
      ),
    );
  }

  TextField _Usuario() {
    return TextField(
      style: TextStyle(fontSize: size.width * 0.05),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        labelText: Preferences.name,
        fillColor: Colors.red,
        hintText: 'Nombre usuario',
        suffixIcon: const Icon(Icons.accessibility),
        helperText:
            (_user.length > 5) ? '' : 'Debe contener almenos 5 caracteres',
        helperStyle: TextStyle(fontSize: size.width * 0.03),
        counter: Text('Letras ${_user.length}'),
      ),
      onChanged: (valor) {
        setState(() {
          _user = valor;
        });
      },
    );
  }

  TextField _Password() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            labelText: '*********',
            hintText: '********',
            suffixIcon: const Icon(Icons.lock_open),
            helperText: (_pass.length > 5) ? '' : 'Almenos 5 caracteres',
            helperStyle: TextStyle(fontSize: size.width * 0.03)),
        onChanged: (valor) => setState(() => _pass = valor));
  }

  Widget _recordarUsuario() {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 115.0)),
        const Text(
          "Recordar usuario",
          style: TextStyle(fontSize: 18.0),
        ),
        Checkbox(
            value: Preferences.recordar,
            activeColor: Colors.red,
            onChanged: (bool? value) =>
                setState(() => Preferences.recordar = value!)
        ),
      ],
    );
  }

  Widget _inicioSesion() {
    return SizedBox(
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              child:
                  const Text("Login", style: TextStyle(color: Colors.white70)),
              //Valida que usuario y contrasena tengan una longitud minima de 5
              // y asigna valores en preferences.
              onPressed: () {
                if (_user.length > 5 && _pass.length > 5) {
                  if (Preferences.recordar == true) {
                    setState(() {
                      Preferences.name = _user;
                      Preferences.password = _pass;
                    });
                  }

                  Navigator.pushNamed(context, 'home');
                }
              }),
        ));
  }
}
