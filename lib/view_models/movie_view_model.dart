
import 'package:movie_details/models/movie.dart';

class MovieViewModel {

  final Movie movie;
  MovieViewModel({this.movie});

  double get popularity {
    return this.movie.popularity;
  }
  int get voteCount {
    return this.movie.voteCount;
  }
  bool get video {
    return this.movie.video;
  }
  String get posterPath {
    return this.movie.posterPath;
  }
  int get id {
    return this.movie.id;
  }
  bool get adult {
    return this.movie.adult;
  }
  String get backdropPath {
    return this.movie.backdropPath;
  }
  String get originalLanguage {
    return this.movie.originalLanguage;
  }
//  List<int> get genreIds {
//    return this.movie.genreIds;
//  }
  String get title {
    return this.movie.title;
  }
//  double get voteAverage {
//    return this.movie.voteAverage;
//  }
  String get overview {
    return this.movie.overview;
  }
  String get releaseDate {
    return this.movie.releaseDate;
  }
}