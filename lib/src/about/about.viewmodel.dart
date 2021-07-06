import 'package:chuck_norris/src/shared/services/Linking.dart';

class AboutViewModel {

  static const String URL = 'https://api.chucknorris.io/';
  final Linking linkingService;

  AboutViewModel({ required this.linkingService });

  Future<bool> openLink() async {
    return linkingService.openLink(URL);
  }
}