#import "TonePlayerPackagePlugin.h"
#if __has_include(<tone_player_package/tone_player_package-Swift.h>)
#import <tone_player_package/tone_player_package-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tone_player_package-Swift.h"
#endif

@implementation TonePlayerPackagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTonePlayerPackagePlugin registerWithRegistrar:registrar];
}
@end
