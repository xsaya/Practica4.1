import '../paginas/paginas.dart';
import 'preferences/preferences.dart';
import 'providers/movies_provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienvenidos',
      initialRoute: 'login',
      routes: {
        'home': (context) => InicioPage(),
        'login': (context) => InputPage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
