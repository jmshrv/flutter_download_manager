
import 'flutter_download_manager_android_platform_interface.dart';

class FlutterDownloadManagerAndroid {
  Future<String?> getPlatformVersion() {
    return FlutterDownloadManagerAndroidPlatform.instance.getPlatformVersion();
  }
}
