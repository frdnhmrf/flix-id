import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/movie_repository.dart';
import '../../../../data/tmdb_movie_repository/tmdb_movie_repository.dart';

part 'movie_respository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) =>
    TmbdMovieRepository();
