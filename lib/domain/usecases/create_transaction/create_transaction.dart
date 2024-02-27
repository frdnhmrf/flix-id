// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;
  CreateTransaction({
    required TransactionRepository transactionRepository,
  }) : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParam params) async {
    var transactionResult = await _transactionRepository.createTransaction(
        transaction: params.transaction);

    return switch (transactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(:final message) => Result.failed(message)
    };
  }
}
