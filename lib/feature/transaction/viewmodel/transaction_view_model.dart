import 'package:bloc/bloc.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import 'package:pockeet/product/models/transaction_model.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial()) {}
  final TransactionManager manager = TransactionManager(FirebaseManager());
  List<TransactionModel> result = [];
}

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionsInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionComplete extends TransactionState {
  final List<TransactionModel>? items;

  TransactionComplete(this.items);
}

class TransactionErrorState extends TransactionState {}
