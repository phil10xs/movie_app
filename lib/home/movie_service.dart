import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/environment_config.dart';
import 'package:movieapp/home/movies_exception.dart';

import 'movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._environmentConfig, this._dio);

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    try {
      print('here');
      // final response = await _dio.get(
      //   "http://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      // );
      final response = await _dio.get(
        "http://api.themoviedb.org/3/movie/popular?api_key=2daecc0e498e4662c01e640c0d9f90d0&language=en-US&page=1",
      );

      print(response.data);
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      print(results);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
