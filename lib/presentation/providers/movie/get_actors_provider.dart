import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_id/presentation/providers/usecases/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/actor.dart';

part 'get_actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorResult = await getActors(GetActorsParam(movieId: movieId));
  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(message: final _) => const [],
  };
}
