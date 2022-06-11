import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_download_manager_android_method_channel.dart';

abstract class FlutterDownloadManagerAndroidPlatform extends PlatformInterface {
  /// Constructs a FlutterDownloadManagerAndroidPlatform.
  FlutterDownloadManagerAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDownloadManagerAndroidPlatform _instance = MethodChannelFlutterDownloadManagerAndroid();

  /// The default instance of [FlutterDownloadManagerAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDownloadManagerAndroid].
  static FlutterDownloadManagerAndroidPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDownloadManagerAndroidPlatform] when
  /// they register themselves.
  static set instance(FlutterDownloadManagerAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
