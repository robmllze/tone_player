#import "TonePlayerPlugin.h"
#if __has_include(<tone_player/tone_player-Swift.h>)
#import <tone_player/tone_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tone_player-Swift.h"
#endif

@implementation TonePlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTonePlayerPackagePlugin registerWithRegistrar:registrar];
}
@end
