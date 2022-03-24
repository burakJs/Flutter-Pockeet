// To parse this JSON data, do
//
//     final deneme = denemeFromJson(jsonString);
import 'package:cloud_firestore/cloud_firestore.dart';

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
  Timestamp? date;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        title: json["title"],
        money: json["money"].toDouble(),
        isIncome: json["isIncome"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "money": money,
        "isIncome": isIncome,
        "date": date,
      };
}

List<TransactionModel> datas = [
  TransactionModel(title: 'Internet', money: -20, date: Timestamp.now()),
  TransactionModel(title: 'Floyd Miles', money: 20, date: Timestamp.now()),
  TransactionModel(title: 'Floyd Miles', money: 300, date: Timestamp.now()),
  TransactionModel(title: 'Gas', money: -60, date: Timestamp.now()),
];
