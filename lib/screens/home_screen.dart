import 'package:flutter/material.dart';
import 'package:movie_app/widgets/now_playing.dart';
import 'package:movie_app/widgets/popular_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Movie app"),
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          PopularMovies(page: 1),
        ],
      ),
    );
  }
}