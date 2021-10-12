# App Store Connect

![Build Status](https://github.com/methodpark/App_Store_Connect/actions/workflows/github-actions.yml/badge.svg)

Dart package for the [Apple App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi).

It is build to improve the automation of the delivery and deployment process for Flutter / cross-platform apps and is used for the [Publisher](https://pub.dev/packages/publisher) package.

Following functionality is supported:

- List all provisioning profiles
- Download a specific provisioning profile

## Installation

With Dart:

```shell
dart pub add app_store_connect
```

With Flutter:

```shell
flutter pub add app_store_connect
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```yml
dependencies:
  app_store_connect: ^0.1.0
```

## Usage

To get your authentication credentials, please follow the documentation by [Apple](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api).

Initialize the `AppStoreConnect` class:

```dart
AppStoreConnect('987-654-321', 'A123456', '/path/to/key.p8');
```

List all profiles:

```dart
List<Profile> allProfiles = await appStoreConnect.getAllProfiles();
```

Download profile:

```dart
Profile profile = await appStoreConnect.downloadProfile('myProfileId');
```

## Features and bugs

Please file feature requests and bugs at the issue [tracker](https://github.com/methodpark/App_Store_Connect/issues).
