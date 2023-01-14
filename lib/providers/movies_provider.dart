import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
export 'package:provider/provider.dart';

//Logica proveer peliulas, ChangeNotifier, avisar a cambio
class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org',
      _apiKey = 'e1ef5a12528a75d741c0768e8e352a3a',
      _language = 'es-ES',
      _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopulars = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getOnDisplayPopulars();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});
    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getOnDisplayPopulars() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': _page});
    final result = await http.get(url);
    final popularResponse = PopularResponse.fromJson(result.body);
    onDisplayPopulars = popularResponse.results;
    notifyListeners();
  }
}
