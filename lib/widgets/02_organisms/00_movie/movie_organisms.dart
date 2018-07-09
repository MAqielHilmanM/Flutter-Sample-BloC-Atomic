import 'package:flutter/material.dart';
import '../../00_atoms/01_form/form_atom.dart';
import '../../00_atoms/00_text/text_atom.dart';
import '../../../models/movie_model.dart';
import '../../01_molecules/00_tile/tile_molecules.dart';
import 'dart:async';

class OrganismsMovie extends StatefulWidget {
  OrganismsMovie(this.onChangedSearch, this.streamLog, this.streamResult);

  final ValueChanged onChangedSearch;
  final Stream<String> streamLog;
  final Stream<List<Movie>> streamResult;

  @override
  _OrganismsMovieState createState() => _OrganismsMovieState();
}

class _OrganismsMovieState extends State<OrganismsMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(8.0),
            child: AtomForm.search(
              onChanged: widget.onChangedSearch,
              placeHolder: 'Search for a Movie',
            )),
        StreamBuilder(
          stream: widget.streamLog,
          builder: (context, snapshot) => Container(
                child: AtomText(snapshot?.data ?? ''),
              ),
        ),
        Flexible(
          child: StreamBuilder<List<Movie>>(
            stream: widget.streamResult,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => MoleculesTile(
                      url: snapshot.data[index].posterPath != null
                          ? "https://image.tmdb.org/t/p/w92" +
                                  snapshot.data[index].posterPath ??
                              ""
                          : null,
                      title: snapshot.data[index].title,
                      subtitle: snapshot.data[index].overview,
                    ),
              );
            },
          ),
        )
      ],
    );
  }
}
