

import 'package:flutter/material.dart';
import 'package:movie_details/services/webservice.dart';

import 'movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(bool isTop) async {
    final results =  await Webservice().fetchMovies(isTop);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }

}