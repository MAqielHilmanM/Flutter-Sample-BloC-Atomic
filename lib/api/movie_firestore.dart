import 'dart:async';
import '../models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiSearchMovie {

  Future<List<Movie>> get(String query) async {
    var movieList = <Movie>[];

    Firestore.instance
        .collection('movie')
        .where('title', isEqualTo: query)
        .snapshots()
        .listen((data) async {
      movieList.clear();
      for (var items in data.documents) {
        movieList.add(Movie.fromSnapshot(items));
      }
    });

    return movieList;
  }

  // Stream<List<Movie>> getStream(String query) {
  //   return Firestore.instance
  //       .collection('movie')
  //       .where('title', isEqualTo: query)
  //       .snapshots()
  //       .asyncMap((data) {
  //     var movieList = <Movie>[];
  //     movieList.clear();
  //     for (var items in data.documents) {
  //       movieList.add(Movie.fromSnapshot(items));
  //     }
  //     return movieList;
  //   });
  // }

  set(Movie data) async {
    Firestore.instance.collection("movie").document().setData(<String, dynamic>{
      'title': data.title,
      'overview': data.overview,
      'posterPath': null
    });
  }
}
