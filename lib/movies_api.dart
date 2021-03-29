import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieAPI {
  static Future getMovies({String token, String url, Dio client}) async {
    final _client = client ?? Dio();
    final url =
        'https://movie-database-imdb-alternative.p.rapidapi.com?i=tt4154796';
    final token = 'd373d5b188msh220ba54e19d2c80p10ac72jsnc96d766a4d8a';

    try {
      var response = await _client.get(url,
          options: Options(headers: {
            'X-Rapidapi-Key': token,
            'X-Rapidapi-Host': 'movie-database-imdb-alternative.p.rapid',
            'Host': ' movie-database-imdb-alternative.p.rapidapi.com',
          }));

      print(response.statusCode);
      var data = response.data;
      print(response.statusCode);
      print(data);
    } on DioError catch (error) {
      print('DIO ERROR MSG ${error.response}');
    }
  }
}
