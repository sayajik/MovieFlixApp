
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_details/models/movie.dart';

class Webservice {

  Future<List<Movie>> fetchMovies(bool isTop) async {
    final urlNowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    final urlTopRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    final response = await http.get(isTop ? urlTopRated : urlNowPlaying);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body); 
       final Iterable json = body["results"];
       return json.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}