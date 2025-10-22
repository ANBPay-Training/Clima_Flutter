import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    var uri = Uri.parse(url);
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      // print(response.body);
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
