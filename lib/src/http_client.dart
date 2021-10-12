import 'dart:io';

import 'package:http/http.dart' as http;

Future<http.Response> get(String uri, String jwt) async {
  final _authorizationHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + jwt
  };

  var response = await http.get(Uri.parse(uri), headers: _authorizationHeader);

  if (response.statusCode != 200) {
    throw HttpException(
        'Http request returned status code ' + response.statusCode.toString(),
        uri: Uri.parse(uri));
  }

  return response;
}
