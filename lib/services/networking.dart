import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final web = Uri.parse(url);
    http.Response response = await http.get(web);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}
