import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://localhost:3000/api";
  postData(data, apiurl) async {
    var fullUrl = _url + apiurl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept-type': 'application/json',
    };
