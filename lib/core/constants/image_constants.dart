import '../extensions/image_extension.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  final String cardBackground = 'Card'.toPng.withIconPath;
  final String circlesFour = 'CirclesFour'.toPng.withIconPath;
  final String gameController = 'GameController'.toPng.withIconPath;
  final String lightning = 'Lightning'.toPng.withIconPath;
  final String profile = 'Profile'.toPng.withIconPath;
  final String statistic = 'Statistic'.toPng.withIconPath;
  final String transaction = 'transaction'.toPng.withIconPath;
  final String wifiHigh = 'WifiHigh'.toPng.withIconPath;
  final String wallet = 'Wallet'.toPng.withIconPath;
  final String upload = 'Upload'.toPng.withIconPath;
  final String arrowsLeftRight = 'ArrowsLeftRight'.toPng.withIconPath;
  final String incomeImage = 'income_image'.toPng.withIconPath;
}
