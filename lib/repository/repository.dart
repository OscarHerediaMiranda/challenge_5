import 'package:dio/dio.dart';
import 'package:fvu_challenge_5/model/movie_response.dart';

class MovieRepository {
  final String apiKey = "d3af67a4a738d498c85a410b0a64af19";
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';

  Future<MovieResponse> getMovies() async {
    var params = {'api_key': apiKey, 'language': 'en-US', 'page': 1};

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}