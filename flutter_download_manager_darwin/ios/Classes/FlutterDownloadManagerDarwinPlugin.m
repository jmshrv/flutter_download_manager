#import "FlutterDownloadManagerDarwinPlugin.h"
#if __has_include(<flutter_download_manager_darwin/flutter_download_manager_darwin-Swift.h>)
#import <flutter_download_manager_darwin/flutter_download_manager_darwin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_download_manager_darwin-Swift.h"
#endif

@implementation FlutterDownloadManagerDarwinPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterDownloadManagerDarwinPlugin registerWithRegistrar:registrar];
}
@end
