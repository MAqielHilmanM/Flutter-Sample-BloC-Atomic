import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title, posterPath, overview;
  Movie(this.title, this.posterPath, this.overview);
  Movie.fromJSON(Map json)
      : title = json['title'],
        posterPath = json['posterPath'],
        overview = json['overview'];
  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot['title'],
        posterPath = snapshot['posterPath'],
        overview = snapshot['overview'];
}

