import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_details/view_models/movie_view_model.dart';

class MovieDetails extends StatelessWidget {
  MovieViewModel movie;

  MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(movie.title),
        ),
        body: new Stack(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://image.tmdb.org/t/p/original/" + movie.backdropPath,
              fit: BoxFit.fill,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              movie.overview,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ]));
  }
}
