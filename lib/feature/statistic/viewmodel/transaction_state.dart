import 'package:pockeet/product/models/transaction_model.dart';

abstract class StatisticState {
  StatisticState();
}

class StatisticLoading extends StatisticState {
  StatisticLoading();
}

class StatisticSuccess extends StatisticState {
  List<TransactionModel> list;
  StatisticSuccess(this.list);
}
