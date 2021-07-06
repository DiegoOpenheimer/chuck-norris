import 'package:url_launcher/url_launcher.dart';

class Linking {
  Future<bool> openLink(String url) => launch(url);
}