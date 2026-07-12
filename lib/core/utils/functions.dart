import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Functions {
  static void launchUrl(String url) async {
    await url_launcher.launchUrl(Uri.parse(url));
  }
}
