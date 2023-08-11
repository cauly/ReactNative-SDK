//
//  RNCaulyAdView.h
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//
#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
#import "Cauly.h"
#import "CaulyAdView.h"
#import "CaulyInterstitialAd.h"
#import "CaulyNativeAd.h"

@interface RNCaulyAdView : UIView{

}

@property (strong, nonatomic) CaulyAdView *caulyAdView;
@property (nonatomic, copy) RCTBubblingEventBlock onDidReceiveBannerAd;
@property (nonatomic, copy) RCTBubblingEventBlock onDidFailToReceiveBannerAd;
@property (nonatomic, copy) RCTBubblingEventBlock onWillShowBannerLandingView;
@property (nonatomic, copy) RCTBubblingEventBlock onDidCloseBannerLandingView;
@property (nonatomic, copy) RCTBubblingEventBlock onDidReceiveNativeAd;
@property (nonatomic, copy) RCTBubblingEventBlock onDidFailToReceiveNativeAd;
@end
