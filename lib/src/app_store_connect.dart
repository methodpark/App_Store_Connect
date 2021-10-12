import 'dart:convert';
import 'dart:io';

import 'package:app_store_connect_apis/src/jwt.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'http_client.dart';
import 'models/profile.dart';

class AppStoreConnect {
  final String _issuer;
  final String _keyId;
  final String _keyFilePath;
  late final String _keyFileContent;

  /// [_issuer] Your issuer ID from the API keys page in App Store Connect
  ///
  /// [_keyId] Your private key ID from App Store Connect
  ///
  /// [_keyFilePath] Path to the private key file from App Store Connect
  AppStoreConnect(this._issuer, this._keyId, this._keyFilePath) {
    loadKeyFileContent();
  }

  /// Gets a list of all provisioning profiles
  Future<List<Profile>> getAllProfiles() async {
    var jwt = createJWT(_issuer, _keyFileContent, _keyId);

    var response = await get(profilesUri, jwt);

    var profiles = _convertResponseToListOfProfiles(response);

    return profiles;
  }

  /// Downloads a specific provisioning profile which is defined by the [profileId]
  Future<Profile> downloadProfile(String profileId) async {
    var jwt = createJWT(_issuer, _keyFileContent, _keyId);

    var response = await get(profilesUri + '/' + profileId, jwt);

    var profile = _convertResponseToProfile(response);

    return profile;
  }

  List<Profile> _convertResponseToListOfProfiles(http.Response response) {
    dynamic jsonResponse = jsonDecode(response.body);
    List<dynamic> allProfiles = jsonResponse['data'] as List<dynamic>;

    var profiles = allProfiles
        .map((dynamic e) => Profile.fromJson(e as Map<String, dynamic>))
        .toList();

    return profiles;
  }

  Profile _convertResponseToProfile(http.Response response) {
    dynamic jsonResponse = jsonDecode(response.body);

    var profile =
        Profile.fromJson(jsonResponse['data'] as Map<String, dynamic>);

    return profile;
  }

  void loadKeyFileContent() {
    try {
      _keyFileContent = File(_keyFilePath).readAsStringSync();
    } catch (e) {
      throw FileSystemException(
          'Could not load the Apple App Store Connect key file', _keyFilePath);
    }
  }
}
