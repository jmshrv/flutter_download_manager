import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_download_manager_darwin_platform_interface.dart';

/// An implementation of [FlutterDownloadManagerDarwinPlatform] that uses method channels.
class MethodChannelFlutterDownloadManagerDarwin extends FlutterDownloadManagerDarwinPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_download_manager_darwin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
