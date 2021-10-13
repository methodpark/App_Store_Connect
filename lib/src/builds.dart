import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'http_client.dart';
import 'jwt.dart';
import 'models/build.dart';

class Builds {
  final String _issuer;
  final String _keyId;
  final String _keyFileContent;

  Builds(this._issuer, this._keyId, this._keyFileContent);

  /// Gets a list of all builds
  Future<List<Build>> getAllBuilds() async {
    var jwt = createJWT(_issuer, _keyFileContent, _keyId);

    var response = await get(buildsUri, jwt);

    var builds = _convertResponseToListOfBuilds(response);

    return builds;
  }

  List<Build> _convertResponseToListOfBuilds(http.Response response) {
    dynamic jsonResponse = jsonDecode(response.body);
    List<dynamic> allProfiles = jsonResponse['data'] as List<dynamic>;

    var profiles = allProfiles
        .map((dynamic e) => Build.fromJson(e as Map<String, dynamic>))
        .toList();

    return profiles;
  }
}
