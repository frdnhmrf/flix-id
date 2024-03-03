import '../../domain/entities/result.dart';
import '../../domain/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<void>> createTransaction({required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
}
