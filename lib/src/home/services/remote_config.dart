import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;
  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  String get appVersion => _remoteConfig.getString('app_version');

  Future<void> initialize() async {
    await _setConfigSettings();
    await fetchAndActivate();
  }

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
  Future<void> fetchAndActivate() async {
    try {
      bool updated = await _remoteConfig.fetchAndActivate();

      if (updated) {
        debugPrint('The config has been updated.');
      } else {
        debugPrint('The config is not updated..');
      }
    } catch (e) {
      debugPrint('Fetch and activate failed');
    }
  }
}

final appConfigProvider = Provider((ref) => FirebaseRemoteConfigService());
