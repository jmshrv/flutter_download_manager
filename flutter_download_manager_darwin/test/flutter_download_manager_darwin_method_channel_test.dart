import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_download_manager_darwin/flutter_download_manager_darwin_method_channel.dart';

void main() {
  MethodChannelFlutterDownloadManagerDarwin platform = MethodChannelFlutterDownloadManagerDarwin();
  const MethodChannel channel = MethodChannel('flutter_download_manager_darwin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
