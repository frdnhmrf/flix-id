import 'package:dio/dio.dart';
import '../repositories/movie_repository.dart';
import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/result.dart';

class TmbdMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYWQ5ZjI0YzA4NTVkN2I1NGRiMTE2MjhlZjg5YmMyOCIsInN1YiI6IjY1ZGRjY2VkYzQzM2VhMDE4NjNkMjg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ty6vjrFCox1a3WKFCnOY9PPzeZFsJQjChrsMQk8bAvA";

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json',
  });
  TmbdMovieRepository({Dio? dio}) : _dio = dio ?? Dio();
  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
        options: _options,
      );

      final results = List<Map<String, dynamic>>.from(response.data['cast']);

      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id?language=en-US',
        options: _options,
      );

      final result = MovieDetail.fromJSON(response.data);

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async {
    return _getMovies(_MovieRepository.nowPlaying.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async =>
      _getMovies(_MovieRepository.upComing.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String categories,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$categories?language=en-US&page=$page',
        options: _options,
      );

      final results = List<Map<String, dynamic>>.from(response.data['result']);

      return Result.success(results.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }
}

enum _MovieRepository {
  nowPlaying('now_playing'),
  upComing('up_coming');

  final String _inString;

  const _MovieRepository(String inString) : _inString = inString;

  @override
  String toString() => _inString;
}
