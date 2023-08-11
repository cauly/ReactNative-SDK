//
//  RNCaulyAdViewManager.h
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//
#import <React/RCTViewManager.h>
#import <UIKit/UIKit.h>
#import "RNCaulyAdView.h"
#import "Cauly.h"
#import "CaulyAdView.h"
#import "CaulyInterstitialAd.h"
#import "CaulyNativeAd.h"

@interface RNCaulyAdViewManager : RCTViewManager<CaulyAdViewDelegate, CaulyNativeAdDelegate>{
  
}
@property (strong, nonatomic) RNCaulyAdView *rnCaulyAdView;
@end
