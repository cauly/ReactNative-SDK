//
//  RNCaulyAdViewManager.m
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//
#import <Foundation/Foundation.h>
#import "RNCaulyAdViewManager.h"

@implementation RNCaulyAdViewManager

RCT_EXPORT_VIEW_PROPERTY(onDidReceiveBannerAd, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDidFailToReceiveBannerAd, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onWillShowBannerLandingView, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDidCloseLandingView, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDidReceiveNativeAd, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDideFailToReceiveNativeAd, RCTBubblingEventBlock);


RCT_EXPORT_MODULE();

- (UIView *)view{
  NSLog(@"[HelloCauly]RNCaulyAdViewManager view().");
  _rnCaulyAdView = [[RNCaulyAdView alloc] init];
  _rnCaulyAdView.caulyAdView.delegate = self;
  NSLog(@"[HelloCauly]CaulyAdView startBannerAdRequest() start.");
  [_rnCaulyAdView.caulyAdView startBannerAdRequest];
  NSLog(@"[HelloCauly]CaulyAdView startBannerAdRequest() finish.");
  return _rnCaulyAdView;
}

RCT_EXPORT_METHOD(removeFromSuperview){
  if(_rnCaulyAdView){
    NSLog(@"[HelloCauly]RNCaulyAdViewManager removeFromSuperview() start.");
    [_rnCaulyAdView removeFromSuperview];
    _rnCaulyAdView = nil;
  }
  NSLog(@"[HelloCauly]RNCaulyAdViewManager removeFromSuperview() finish.");
}

#pragma - CaulyAdViewDelegate
// 배너 광고 정보 수신 성공
- (void)didReceiveAd:(CaulyAdView *)adView isChargeableAd:(BOOL)isChargeableAd {
  NSLog(@"[HelloCauly]didReceiveAd");
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onDidReceiveBannerAd){
    NSLog(@"didReceiveBannerAd not registered.");
  }
  _rnCaulyAdView.onDidReceiveBannerAd(@{
    @"isChargeableAd": @(isChargeableAd)
  });
}

// 배너 광고 정보 수신 실패
- (void)didFailToReceiveAd:(CaulyAdView *)adView errorCode:(int)errorCode errorMsg:(NSString *)errorMsg {
  NSLog(@"[HelloCauly]didFailToReceiveAd : %d(%@)", errorCode, errorMsg);
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onDidFailToReceiveBannerAd){
    NSLog(@"didFailToReceiveBannerAd not registered.");
  }
  _rnCaulyAdView.onDidFailToReceiveBannerAd(@{
    @"errorCode": @(errorCode),
    @"errorMsg": errorMsg
  });
}

// fullsite 혹은 rich 배너 광고 랜딩 화면 표시
- (void)willShowLandingView:(CaulyAdView *)adView {
  NSLog(@"[HelloCauly]willShowLandingView");
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onWillShowBannerLandingView){
    NSLog(@"willShowLandingView not registered.");
  }
  _rnCaulyAdView.onWillShowBannerLandingView(@{

  });
}

// fullsite 혹은 rich 배너 광고 랜딩 화면 닫음
- (void)didCloseLandingView:(CaulyAdView *)adView {
  NSLog(@"[HelloCauly]didCloseLandingView");
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onDidCloseBannerLandingView){
    NSLog(@"didCloseLandingView not registered.");
  }
  _rnCaulyAdView.onDidCloseBannerLandingView(@{

  });
}

#pragma - CaulyNativeAdDelegate
- (void)didReceiveNativeAd:(CaulyNativeAd *)nativeAd isChargeableAd:(BOOL)isChargeableAd{
  NSLog(@"[HelloCauly]didReceiveNativeAd");
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onDidReceiveNativeAd){
    NSLog(@"didReceiveNativeAd not registered.");
  }
  _rnCaulyAdView.onDidReceiveNativeAd(@{
    @"isChargeableAd": @(isChargeableAd)
  });
}

-(void)didFailToReceiveNativeAd:(CaulyNativeAd *)nativeAd errorCode:(int)errorCode errorMsg:(NSString *)errorMsg{
  NSLog(@"[HelloCauly]didFailToReceiveNativeAd");
  // js로 이벤트 전달
  if(!_rnCaulyAdView.onDidFailToReceiveNativeAd){
    NSLog(@"didFailToReceiveNativeAd not registered.");
  }
  _rnCaulyAdView.onDidFailToReceiveNativeAd(@{
    @"errorCode": @(errorCode),
    @"errorMsg": errorMsg
  });
}

@end
