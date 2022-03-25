import 'package:bloc/bloc.dart';
import '../../../core/data/concrete/firebase_manager.dart';
import '../../../product/data/transaction_manager.dart';
import '../../../product/models/transaction_model.dart';

class TotalBalanceBloc extends Cubit<double> {
  final TransactionManager _manager;
  TotalBalanceBloc({TransactionManager? manager})
      : _manager = manager ?? TransactionManager(FirebaseManager()),
        super(-1);

  final double initialValue = -1;
  bool isIncome = true;

  Future<void> getTotalIncome() async {
    final List<TransactionModel> modelList = await _manager.getAllTransactionByIncome(true);
    double result = 0;
    for (var model in modelList) {
      result += model.money ?? 0;
    }
    emit(result == initialValue ? 0 : result);
  }

  Future<void> getTotalExpanse() async {
    final List<TransactionModel> modelList = await _manager.getAllTransactionByIncome(false);
    double result = 0;
    for (var model in modelList) {
      result += model.money ?? 0;
    }

    emit(result == initialValue ? 0 : result);
  }

  Future<void> getTotalBalance() async {
    final double result = await _manager.getTotalMoney();
    emit(result == initialValue ? 0 : result);
  }
}
