import 'package:flutter/material.dart';
import 'package:movie_details/view_models/movie_list_view_model.dart';
import 'package:movie_details/view_models/movie_view_model.dart';
import 'package:movie_details/views/movie_list_item.dart';
import 'package:provider/provider.dart';

class NowPlayingPage extends StatefulWidget {

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {

  final searchController = TextEditingController();
  List<MovieViewModel> filteredMovies = List<MovieViewModel>();

  getMoviesData(vm) {
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
    print("InitStatus Now Playing Movie Tab Display");
    searchController.addListener(() {
      final text = searchController.text.toLowerCase();
    });

//    new Future.delayed(Duration.zero,() {
//      vm = Provider.of<MovieListViewModel>(context);
//      vm.fetchMovies();
//    });

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
    final vm = Provider.of<MovieListViewModel>(context);
    vm.fetchMovies(false);
    print('build Now Playing Movie Tab');
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        title: TextField(
          style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Movie',
          ),
          controller: searchController,
          onTap: getMoviesData(vm),
        )
      ),
      body: Container(
          child: MovieListItem(movies: filteredMovies)),
    );
  }
}
