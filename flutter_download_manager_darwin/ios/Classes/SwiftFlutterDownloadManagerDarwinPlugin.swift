import Flutter
import UIKit

public class SwiftFlutterDownloadManagerDarwinPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_download_manager_darwin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDownloadManagerDarwinPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
