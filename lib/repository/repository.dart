import 'package:movie_app/model/movie_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getTrendingUrl = '$mainUrl/movie/trending';
  var movieUrl = "$mainUrl/movie";

  Future<MovieResponse> getMovies(int page) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": page
    };
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
      Response response =
      await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getRecommendedMovies(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
      Response response = await _dio.get(movieUrl + "/$id" + "/similar", queryParameters: params);
      return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getTrendingMovies(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    Response response = await _dio.get(getTrendingUrl + "/all" + "/week", queryParameters: params);
    return MovieResponse.fromJson(response.data);
  }
}
