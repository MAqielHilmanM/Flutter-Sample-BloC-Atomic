import 'package:flutter/material.dart';
import 'screens/movie/movie_bloc.dart';
import 'screens/movie/movie_provider.dart';
import 'screens/movie/movie_view.dart';
import 'api/movie_api.dart';
import 'utils/constant.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieProvider(
      child: MaterialApp(
        title: 'Movie Apps',
        theme: ThemeData(),
        home: MovieView(),
      ),
    );
  }
}
