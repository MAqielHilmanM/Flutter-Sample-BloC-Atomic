import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import '../../utils/constant.dart';
import '../../api/movie_firestore.dart';
import 'movie_bloc.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(ApiSearchMovie()),
        super(child: child, key: key);
}
