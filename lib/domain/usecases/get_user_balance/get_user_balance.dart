// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_user_balance/get_user_balance_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetUserBalance implements UseCase<Result<int>, GetUserBalanceParam> {
  final UserRepository _userRepository;
  GetUserBalance({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<Result<int>> call(GetUserBalanceParam params) {
    return _userRepository.getUserBalance(uid: params.userId);
  }
}
