import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_download_manager_android/flutter_download_manager_android.dart';
import 'package:flutter_download_manager_android/flutter_download_manager_android_platform_interface.dart';
import 'package:flutter_download_manager_android/flutter_download_manager_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDownloadManagerAndroidPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterDownloadManagerAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterDownloadManagerAndroidPlatform initialPlatform = FlutterDownloadManagerAndroidPlatform.instance;

  test('$MethodChannelFlutterDownloadManagerAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDownloadManagerAndroid>());
  });

  test('getPlatformVersion', () async {
    FlutterDownloadManagerAndroid flutterDownloadManagerAndroidPlugin = FlutterDownloadManagerAndroid();
    MockFlutterDownloadManagerAndroidPlatform fakePlatform = MockFlutterDownloadManagerAndroidPlatform();
    FlutterDownloadManagerAndroidPlatform.instance = fakePlatform;
  
    expect(await flutterDownloadManagerAndroidPlugin.getPlatformVersion(), '42');
  });
}
