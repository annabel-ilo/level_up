import 'package:flutter/material.dart';
import 'package:level_up/model/movieList.dart';
import 'package:level_up/ui/movie/movieScreen.dart';

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
          MovieDetailsThumbnail(thumbnail: movie.images[0] ),
        ],
      ),

      // body: Container(
      //   child: Center(
      //     child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: Text('Go Back to $movie'),
      //         style: ElevatedButton.styleFrom(
      //           primary: Colors.purpleAccent.shade700,
      //         )),
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({
    Key? key,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(alignment: Alignment.center, children: [
          Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              )),
          Icon(
            Icons.play_circle_outline,
            size: 100,
          )
        ])
      ],
    );
  }
}
