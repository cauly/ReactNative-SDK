//
//  RCTCaulyInterstitialAdModule.h
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/29.
//
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#import <UIKit/UIKit.h>
#import "Cauly.h"
#import "CaulyAdView.h"
#import "CaulyInterstitialAd.h"
#import "CaulyNativeAd.h"
#import "AppDelegate.h"
#import "RNCaulyAdView.h"

@interface RCTCaulyInterstitialAdModule : NSObject <RCTBridgeModule, CaulyInterstitialAdDelegate>

@property (strong, nonatomic) CaulyInterstitialAd *caulyInterstitialAd;
@property (strong, nonatomic) RCTResponseSenderBlock receiveInterstitialAd;
@property (strong, nonatomic) RCTResponseSenderBlock failToReceiveInterstitialAd;
@property (strong, nonatomic) RCTResponseSenderBlock willShowInterstitialAd;
@property (strong, nonatomic) RCTResponseSenderBlock closeInterstitialAd;

@end
