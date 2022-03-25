import 'package:bloc/bloc.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/feature/transaction/viewmodel/transaction_state.dart';
import 'package:pockeet/product/models/transaction_model.dart';

import '../../../product/data/transaction_manager.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial()) {
    getAllTransaction();
  }
  final TransactionManager manager = TransactionManager(FirebaseManager());
  List<TransactionModel> model = [];
  Future<void> getAllTransaction() async {
    emit(TransactionLoading());
    model = await manager.getAllTransaction();
    emit(TransactionComplete(model));
  }

  Future<void> getIsIncomeTransaction(bool isIncome) async {
    emit(TransactionLoading());
    model = await manager.getAllTransactionByIncome(isIncome);
    emit(TransactionComplete(model));
  }
}
