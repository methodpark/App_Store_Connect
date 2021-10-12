import 'dart:io';

import 'package:app_store_connect_apis/src/provisioning.dart';

import 'models/profile.dart';

class AppStoreConnect {
  final String _issuer;
  final String _keyId;
  final String _keyFilePath;
  late final String _keyFileContent;
  late final Provisioning _provisioning;

  /// [_issuer] Your issuer ID from the API keys page in App Store Connect
  ///
  /// [_keyId] Your private key ID from App Store Connect
  ///
  /// [_keyFilePath] Path to the private key file from App Store Connect
  AppStoreConnect(this._issuer, this._keyId, this._keyFilePath) {
    loadKeyFileContent();
    _provisioning = Provisioning(_issuer, _keyId, _keyFileContent);
  }

  /// Gets a list of all provisioning profiles
  Future<List<Profile>> getAllProfiles() async {
    return _provisioning.getAllProfiles();
  }

  /// Downloads a specific provisioning profile which is defined by the [profileId]
  Future<Profile> downloadProfile(String profileId) async {
    return _provisioning.downloadProfile(profileId);
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
