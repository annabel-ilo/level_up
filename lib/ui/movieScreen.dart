import 'package:flutter/material.dart';

import 'package:level_up/model/movieList.dart';

class MovieListView extends StatelessWidget {
  final List<MovieListDetail> movieList = MovieListDetail.getMovies();

  // const MovieListView({Key? key}) : super(key: key);

  // final List movieList = [
  //   "Titanic",
  //   "Blade Runner",
  //   "Rambo",
  //   "The Avenger",
  //   "Avatar",
  //   "I Am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "Interstellar",
  //   "Game of Thrones",
  //   "Vikings"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.9),
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.deepPurple.shade700,
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return movieCard(movieList[index], context);
              // return Card(
              //   color: Colors.white,
              //   elevation: 5.0,
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       child: Container(
              //           width: 200,
              //           height: 200,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(12),
              //             image: DecorationImage(
              //                 image: NetworkImage(movieList[index].images[0]),
              //                 fit: BoxFit.cover),
              //           ),
              //           child: null),
              //     ),
              //     trailing: Text(
              //       '...',
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     title: Text(movieList[index].title),
              //     subtitle: Text(movieList[index].genre),
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => MovieDetailView(
              //                     movieName: movieList.elementAt(index).title,
              //                     movie: movieList.elementAt(index).director,
              //                   )));
              //     },
              //   ),
              // );
            }));
  }

  Widget movieCard(MovieListDetail movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 60.0, bottom: 8.0, top: 8.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(movie.title),
                    Text('Rating ${movie.imdbRating} / 10'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released: ${movie.released}"),
                    Text(movie.runtime),
                    Text(movie.rated)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailView(
                      movie: movie.title,
                    )));
      },
    );
  }
}

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final String movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back to $movie'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent.shade700,
              )),
        ),
      ),
    );
  }
}
