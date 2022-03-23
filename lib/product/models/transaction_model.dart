import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TransactionModel {
  final String title;
  final Timestamp date;
  final double money;
  late final bool isIncome;
  TransactionModel({
    required this.title,
    required this.date,
    required this.money,
  }) {
    isIncome = money > 0;
  }
}

List<TransactionModel> datas = [
  TransactionModel(title: 'Internet', money: -20, date: Timestamp.now()),
  TransactionModel(title: 'Floyd Miles', money: 20, date: Timestamp.now()),
  TransactionModel(title: 'Floyd Miles', money: 300, date: Timestamp.now()),
  TransactionModel(title: 'Gas', money: -60, date: Timestamp.now()),
];
