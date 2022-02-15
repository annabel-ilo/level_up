import 'package:flutter/material.dart';
import 'package:level_up/model/movieList.dart';
import 'package:level_up/ui/movie/movieScreen_widgets.dart';

class MovieDetailView extends StatelessWidget {
  MovieDetailView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieListDetail movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeadWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images),
        ],
      ),
    );
  }
}
