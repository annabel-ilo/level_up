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
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images),
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
              height: 200,
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
            color: Colors.white,
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

class MovieDetailsCast extends StatelessWidget {
  final MovieListDetail movie;

  const MovieDetailsCast({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieField(
            field: "Cast",
            value: movie.actors,
          ),
          MovieField(
            field: "Director",
            value: movie.director,
          ),
          MovieField(
            field: "Awards",
            value: movie.awards,
          ),
          MovieField(
            field: "Language",
            value: movie.language,
          ),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field: ",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(255, 31, 30, 30),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(248, 0, 0, 0),
            ),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPosters({
    Key? key,
    required this.posters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("See More Posters".toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(248, 0, 0, 0),
              )),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                height: 170,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8.0,
                  ),
                  itemCount: posters.length,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(posters[index]),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
