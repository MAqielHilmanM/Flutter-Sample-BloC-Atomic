import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import '../utils/constant.dart';

class ApiSearchMovie {
  final http.Client _client = http.Client();
  static const String apikey = Constant.API_KEY;

  static const String _url = Constant.BASE_URL + "3/search/movie?api_key=$apikey&query={1}";

  Future<List<Movie>> get(String query) async {
    List<Movie> list = [];
    await _client
        .get(Uri.parse(_url.replaceFirst("{1}", query)))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json["results"])
        .then((movies) =>
            movies.forEach((movie) => list.add(Movie.fromJSON(movie))));
    return list;
  }
}
