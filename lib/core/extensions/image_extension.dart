import '../constants/app_constants.dart';

extension ImageExtension on String {
  String get toPng => '$this.png';
  String get withIconPath => '${AppConstants.iconAssetsPath}/$this';
}
