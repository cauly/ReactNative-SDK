//
//  RCTCaulyAdSettingModule.h
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//
#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>
#import "Cauly.h"
#import "CaulyAdView.h"
#import "CaulyInterstitialAd.h"
#import "CaulyNativeAd.h"

@interface RCTCaulyAdSettingModule : NSObject <RCTBridgeModule>
@property (strong, nonatomic) CaulyAdSetting *adSetting;
@end
