import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_download_manager_darwin/flutter_download_manager_darwin.dart';
import 'package:flutter_download_manager_darwin/flutter_download_manager_darwin_platform_interface.dart';
import 'package:flutter_download_manager_darwin/flutter_download_manager_darwin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDownloadManagerDarwinPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterDownloadManagerDarwinPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterDownloadManagerDarwinPlatform initialPlatform = FlutterDownloadManagerDarwinPlatform.instance;

  test('$MethodChannelFlutterDownloadManagerDarwin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDownloadManagerDarwin>());
  });

  test('getPlatformVersion', () async {
    FlutterDownloadManagerDarwin flutterDownloadManagerDarwinPlugin = FlutterDownloadManagerDarwin();
    MockFlutterDownloadManagerDarwinPlatform fakePlatform = MockFlutterDownloadManagerDarwinPlatform();
    FlutterDownloadManagerDarwinPlatform.instance = fakePlatform;
  
    expect(await flutterDownloadManagerDarwinPlugin.getPlatformVersion(), '42');
  });
}
