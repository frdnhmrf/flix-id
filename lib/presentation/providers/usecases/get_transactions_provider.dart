import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/get_transactions/get_transactions.dart';
import '../repositories/transaction_repository/transaction_respository_provider.dart';

part 'get_transactions_provider.g.dart';

@riverpod
GetTransactions getTransactions(GetTransactionsRef ref) =>
    GetTransactions(transactionRepository: ref.watch(transactionRepositoryProvider));
