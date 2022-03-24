class OnboardModel {
  String image;
  String title;
  String description;
  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> contents = [
  OnboardModel(
      image: 'assets/images/saving.png',
      title: 'Poocket Hoşgeldiniz',
      description: ''),
  OnboardModel(
      image: 'assets/images/finance.png',
      title: 'Harcamalarınzı Kontrol Edin',
      description: ''),
  OnboardModel(
      image: 'assets/images/revenue.png',
      title: 'İstatistiklerinizi görün',
      description: ''),
];
