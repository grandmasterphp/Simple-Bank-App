import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/components/transactions.dart';

final transactionHistoryProvider =
    StateNotifierProvider((ref) => TransactionHistory());

class TransactionHistory extends StateNotifier<List<Map<dynamic, Object>>> {
  TransactionHistory() : super(transactions);

  void addNewTransactionHistory(Map<dynamic, Object> tHistory) {
    state = [...state, tHistory];
  }
}
