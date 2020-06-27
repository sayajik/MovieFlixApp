import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_details/view_models/movie_view_model.dart';
import 'package:movie_details/views/movie_details.dart';

class MovieListItem extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieListItem({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemCount: this.movies.length,
      itemBuilder: (context, index) {

        final movie = this.movies[index];

        return Slidable(
            actions: <Widget>[
              IconSlideAction(
                  icon: Icons.delete,
                  caption: 'Delete',
                  color: Colors.redAccent,
                  //not defined closeOnTap so list will get closed when clicked
                  onTap: () {
                    print("Delete ${movies[index]} is Clicked");
                    movies.removeAt(index);

                  }
              ),
            ],
//            secondaryActions: <Widget>[
//              IconSlideAction(
//                  icon: Icons.clear,
//                  color: Colors.red,
//                  caption: 'Cancel',
//                  closeOnTap: false, //list will not close on tap
//                  onTap: () {
//                    print("More ${movies[index]} is Clicked");
//                  }
//              )
//            ],
            child : ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://image.tmdb.org/t/p/w342"+movie.posterPath)
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                width: 50,
                height: 100,
              ),
              onTap: () => displayDetials(movie, context),
              title: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(movie.title,
                        style: TextStyle(fontSize: 20)),
                    Text(movie.overview,  maxLines: 2)
                  ],
                ),
              ),
            ),
          actionPane: SlidableDrawerActionPane(),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.white,
        );
      },
    );

  }

  void displayDetials(MovieViewModel movie, BuildContext context) {
    print("DisplayDetials - "+movie.title);
    Navigator.push(context, new MaterialPageRoute(builder:
        (BuildContext context) => new MovieDetails(movie)));
  }
}
