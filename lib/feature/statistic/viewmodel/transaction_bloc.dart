import 'package:bloc/bloc.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/feature/statistic/viewmodel/transaction_state.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import 'package:pockeet/product/models/transaction_model.dart';

class StatisticBloc extends Cubit<StatisticState> {
  final TransactionManager _manager;
  StatisticBloc({TransactionManager? manager})
      : _manager = manager ?? TransactionManager(FirebaseManager()),
        super(StatisticLoading());

  bool isIncome = true;

  Future<void> changeIncome() async {
    isIncome = !isIncome;
    getAllTransactionByIncome();
  }

  Future<void> getAllTransactionByIncome() async {
    emit(StatisticLoading());
    List<TransactionModel> list = await _manager.getAllTransactionByIncome(isIncome);
    emit(StatisticSuccess(list));
  }
}
