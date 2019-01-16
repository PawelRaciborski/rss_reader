import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class RssRepository {
    Future<AtomFeed> loadFeeds() async {
      final client = http.Client();
      final response = await client.get("https://pawelraciborski.github.io/feed.xml");
      return AtomFeed.parse(response.body);
    }
}