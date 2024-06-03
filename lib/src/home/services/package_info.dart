import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static PackageInfo? _instance;

  String get appVersion => _instance?.version ?? '0.0.0';

  Future<void> initialize() async {
    _instance = await PackageInfo.fromPlatform();
  }
}

final appInfoProvider = Provider((ref) => AppInfo());
