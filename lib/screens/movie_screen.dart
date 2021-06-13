import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/widgets/recommended_movies.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({required this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState(movie);
}

class _MovieScreenState extends State<MovieScreen> {
  final Movie movie;

  _MovieScreenState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Builder(builder: (context) {
        return new SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                  "https://image.tmdb.org/t/p/original/" + movie.backPoster),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    movie.title +
                        "  |  " +
                        movie.rating.toString() +
                        " ★  |  " +
                        "en",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                movie.overview,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontSize: 12.0, height: 1.5),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RecommendedMovies(id: movie.id)
            // SimilarMovies(id: movie.id)
          ],
        ));
      }),
    );
  }
}
