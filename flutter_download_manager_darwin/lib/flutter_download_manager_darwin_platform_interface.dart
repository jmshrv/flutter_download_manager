import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_download_manager_darwin_method_channel.dart';

abstract class FlutterDownloadManagerDarwinPlatform extends PlatformInterface {
  /// Constructs a FlutterDownloadManagerDarwinPlatform.
  FlutterDownloadManagerDarwinPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDownloadManagerDarwinPlatform _instance = MethodChannelFlutterDownloadManagerDarwin();

  /// The default instance of [FlutterDownloadManagerDarwinPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDownloadManagerDarwin].
  static FlutterDownloadManagerDarwinPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDownloadManagerDarwinPlatform] when
  /// they register themselves.
  static set instance(FlutterDownloadManagerDarwinPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
