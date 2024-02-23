import 'platform_helper.dart'
    if (dart.library.html) './web_platform.dart'
    if (dart.library.io) './other_platform.dart';

abstract class CustomPlatform {
  factory CustomPlatform() => getInstance();
  Future<bool> checkIsAdminDomain();
}
