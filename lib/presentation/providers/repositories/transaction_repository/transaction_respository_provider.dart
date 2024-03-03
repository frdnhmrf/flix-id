import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/firebase/firebase_transaction_respository.dart';
import '../../../../data/repositories/transaction_repository.dart';

part 'transaction_respository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) =>
    FirebaseTransactionRepository();
