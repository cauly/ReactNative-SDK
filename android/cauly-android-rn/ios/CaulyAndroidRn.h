
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNCaulyAndroidRnSpec.h"

@interface CaulyAndroidRn : NSObject <NativeCaulyAndroidRnSpec>
#else
#import <React/RCTBridgeModule.h>

@interface CaulyAndroidRn : NSObject <RCTBridgeModule>
#endif

@end
