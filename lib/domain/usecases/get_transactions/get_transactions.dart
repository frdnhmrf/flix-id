// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetTransactions
    implements UseCase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;
  GetTransactions({
    required TransactionRepository transactionRepository,
  }) : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionsResult =
        await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (transactionsResult) {
      Success(value: final transactions) => Result.success(transactions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
