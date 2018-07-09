import 'package:flutter/material.dart';

import 'movie_bloc.dart';
import 'movie_provider.dart';
import '../../api/movie_firestore.dart';
import '../../models/movie_model.dart';
import '../../widgets/02_organisms/00_movie/movie_organisms.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = new MovieBloc(new ApiSearchMovie());
    movieBloc.query.add("Sample");

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Bloc x Atomic'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                movieBloc.movie.add(Movie("Sample", "Sample", "sample"));
              },
            ),
          )
        ],
      ),
      body:
          OrganismsMovie(movieBloc.query.add, movieBloc.log, movieBloc.results),
    );
  }
}
