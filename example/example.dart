import 'package:app_store_connect/app_store_connect.dart';

Future<void> main(List<String> args) async {
  var appStoreConnect =
      AppStoreConnect('987-654-321', 'A123456', '/path/to/key.p8');

  var profiles = await appStoreConnect.getAllProfiles();
  print(profiles);

  var myProfile = await appStoreConnect.downloadProfile('profileId');
  print(myProfile);
}
