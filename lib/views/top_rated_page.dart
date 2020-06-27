import 'package:flutter/material.dart';
import 'package:movie_details/view_models/movie_list_view_model.dart';
import 'package:movie_details/view_models/movie_view_model.dart';
import 'package:movie_details/views/movie_list_item.dart';
import 'package:provider/provider.dart';

class TopRatedPage extends StatefulWidget {
  @override
  _TopRatedPageState createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {

  final searchController = TextEditingController();
  List<MovieViewModel> filteredMovies = List<MovieViewModel>();

  getTopRatedMoviesData(vm) {
    filteredMovies.clear();
    if(searchController.text.isEmpty) {
      filteredMovies = vm.movies;
    } else {
      vm.movies.forEach((movies) {
        if ((movies.title).toUpperCase().contains((searchController.text).toUpperCase()))
          filteredMovies.add(movies);
        });
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("InitStatus Top Rated Movie Tab Display");
    searchController.addListener(() {
      final text = searchController.text.toLowerCase();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build Top Rated Movie Tab');
    final vm = Provider.of<MovieListViewModel>(context);
    vm.fetchMovies(true);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Movie',
            ),
            controller: searchController,
            onTap: getTopRatedMoviesData(vm),
          )
      ),
      body: Container(
          child: MovieListItem(movies: filteredMovies)),
    );
  }
}
