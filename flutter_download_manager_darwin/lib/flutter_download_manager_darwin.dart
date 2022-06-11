
import 'flutter_download_manager_darwin_platform_interface.dart';

class FlutterDownloadManagerDarwin {
  Future<String?> getPlatformVersion() {
    return FlutterDownloadManagerDarwinPlatform.instance.getPlatformVersion();
  }
}
