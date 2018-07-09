import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../../models/movie_model.dart';
import '../../api/movie_firestore.dart';

class MovieBloc {
  final ApiSearchMovie api;

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();
  StreamController<Movie> _movieController = StreamController<Movie>();

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;
  Sink<Movie> get movie => _movieController.sink;

  MovieBloc(this.api) {

    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();

    // _query.distinct().stream.listen((data){
    //   _results = api.getStream(data);
    // });

    _movieController.stream.listen((add) {
      api.set(add);
    });

    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
        .asBroadcastStream();
  }

  void dispose() {
    _movieController.close();
  }
}
