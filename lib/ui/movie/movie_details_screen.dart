import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeadWithPoster(movie: movie),
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
        ]),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(0, 15, 7, 87),
                Colors.deepPurple.shade200,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsHeadWithPoster extends StatelessWidget {
  final MovieListDetail movie;

  const MovieDetailsHeadWithPoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0]),
          SizedBox(width: 15),
          Expanded(
              child: MovieDetailsHeader(
            movie: movie,
          ))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({
    Key? key,
    required this.poster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(poster),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final MovieListDetail movie;
  const MovieDetailsHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 59, 32, 107),
          ),
        ),
        Text(
          "${movie.title}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(
                  text: "more...",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.deepPurple.shade700,
                  )),
            ])),
      ],
    );
  }
}
