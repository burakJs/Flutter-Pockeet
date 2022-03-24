// To parse this JSON data, do
//
//     final deneme = denemeFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  TransactionModel({
    this.title,
    this.money,
    this.isIncome,
    this.date,
  });

  String? title;
  double? money;
  bool? isIncome;
  DateTime? date;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

List<TransactionModel> datas = [
  TransactionModel(title: 'Internet', money: -20, date: DateTime.now()),
  TransactionModel(title: 'Floyd Miles', money: 20, date: DateTime.now()),
  TransactionModel(title: 'Floyd Miles', money: 300, date: DateTime.now()),
  TransactionModel(title: 'Gas', money: -60, date: DateTime.now()),
];
