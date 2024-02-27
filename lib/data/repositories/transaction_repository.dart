import '../../domain/entities/transaction.dart';

import '../../domain/entities/result.dart';

abstract interface class TransactionRepository {
  Future<Result<void>> createTransaction({required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
}
