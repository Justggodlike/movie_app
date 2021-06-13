import 'package:flutter/material.dart';
import 'package:movie_app/bloc/get_movie_recommended_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/screens/movie_screen.dart';

class RecommendedMovies extends StatefulWidget {
  final int id;

  RecommendedMovies({required this.id});

  @override
  _RecommendedMoviesState createState() => _RecommendedMoviesState(id);
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  final int id;

  _RecommendedMoviesState(this.id);

  @override
  void initState() {
    super.initState();
    recommendedMoviesBloc..getRecommendedMovies(id);
  }

  @override
  void dispose() {
    recommendedMoviesBloc..drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<MovieResponse>(
          stream: recommendedMoviesBloc.subject.stream,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            return _buildHomeWidget(snapshot.data);
          },
        )
      ],
    );
  }

  Widget _buildHomeWidget(MovieResponse? data) {
    List<Movie> movies = data!.movies;
    return Container(
      height: 270.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieScreen(movie: movies[index]),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: movies[index].id,
                    child: Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w200/" +
                                      movies[index].poster)),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      movies[index].title,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
