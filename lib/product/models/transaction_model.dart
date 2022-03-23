class TransactionModel {
  final String title;
  final String date;
  final double money;
  TransactionModel({
    required this.title,
    required this.date,
    required this.money,
  });
}

List<TransactionModel> datas = [
  TransactionModel(
      title: 'Internet', money: -20, date: "10 Jan 2022 / 3.06 AM"),
  TransactionModel(
      title: 'Floyd Miles', money: 20, date: "10 Jan 2022 / 3.06 AM"),
  TransactionModel(
      title: 'Floyd Miles', money: 300, date: "10 Jan 2022 / 3.06 AM"),
  TransactionModel(title: 'Gas', money: -60, date: "10 Jan 2022 / 3.06 AM"),
];

List<TransactionModel> get incomeDatas {
  return datas.where((element) => element.money > 0).toList();
}

List<TransactionModel> get expenseDatas {
  return datas.where((element) => element.money > 0).toList();
}
