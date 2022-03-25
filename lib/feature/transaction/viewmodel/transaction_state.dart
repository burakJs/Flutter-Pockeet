import '../../../product/models/transaction_model.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionComplete extends TransactionState {
  final List<TransactionModel>? items;

  TransactionComplete(this.items);
}

class TransactionErrorState extends TransactionState {}
