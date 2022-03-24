// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      title: json['title'] as String?,
      money: (json['money'] as num?)?.toDouble(),
      isIncome: json['isIncome'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'money': instance.money,
      'isIncome': instance.isIncome,
      'date': instance.date?.toIso8601String(),
    };
