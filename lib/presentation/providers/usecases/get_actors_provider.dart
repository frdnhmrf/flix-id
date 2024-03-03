import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/get_actors/get_actors.dart';
import '../repositories/movie_repository/movie_respository_provider.dart';

part 'get_actors_provider.g.dart';

@riverpod
GetActors getActors(GetActorsRef ref) =>
    GetActors(movieRepository: ref.watch(movieRepositoryProvider));
