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
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
  OnboardModel(
      image: 'assets/images/finance.png',
      title: 'Covid-19 Information',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
  OnboardModel(
      image: 'assets/images/revenue.png',
      title: 'Just Stay at Home',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
];
