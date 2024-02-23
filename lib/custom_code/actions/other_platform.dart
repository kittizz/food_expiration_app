import 'custom_platform.dart';

CustomPlatform getInstance() => CustomPlatformOther();

class CustomPlatformOther implements CustomPlatform {
  @override
  Future<bool> checkIsAdminDomain() async {
    return false;
  }
}
