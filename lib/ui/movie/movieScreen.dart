import 'package:flutter/material.dart';

import 'package:level_up/model/movieList.dart';
import 'package:level_up/ui/movie/movie_details_screen.dart';

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
        backgroundColor: Colors.deepPurpleAccent.shade700,
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.deepPurple.shade700,
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  movieCard(movieList[index], context),
                  Positioned(
                      top: 15, child: movieImage(movieList[index].images[0])),
                ],
              );
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
        margin: EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          margin: EdgeInsets.only(left: 45.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 45.0, bottom: 8.0, top: 8.0, right: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Rating ${movie.imdbRating} / 10',
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailView(
                      movie: movie,
                    )));
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.5,
      color: Color.fromARGB(255, 83, 79, 79),
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              imageUrl 
                  // 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}


