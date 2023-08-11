//
//  RCTCaulyInterstitialAdModule.m
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/29.
//

#import <Foundation/Foundation.h>
#import "RCTCaulyInterstitialAdModule.h"

// 헤더파일 가져오기
@implementation RCTCaulyInterstitialAdModule

/* 네이티브 모듈 내보내는 메서드
 인자로 모듈의 이름을 지정한다.
 인자를 지정하지 않으면, 클래스 이름에서 RCT를 제외한 부분을 이름으로 사용한다 (CaulyModule)
 인자를 문자열 ""로 지정하지 말것!
 */
RCT_EXPORT_MODULE();

// js에서 호출 가능한 메서드 만들기
RCT_EXPORT_METHOD(initWithParentViewController){
  NSLog(@"[HelloCauly]RCTCaulyInterstitialAdModule initWithParentViewController() start.");
  NSLog(@"[HelloCauly]get AppDelegate start.");
  AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
  NSLog(@"[HelloCauly]get AppDelegate finish.");
  NSLog(@"[HelloCauly]CaulyInterstitialAd initWithParentViewController() start.");
  _caulyInterstitialAd = [[CaulyInterstitialAd alloc] initWithParentViewController:appdelegate.window.rootViewController];
  _caulyInterstitialAd.delegate = self;
  NSLog(@"[HelloCauly]CaulyInterstitialAd initWithParentViewController() finish.");
  
  // TODO  이녀석은 RCTCaulyModule이 아니라, RCTView와 RCTViewManager를 확장하는 RCTCaulyView에서 처리해야할듯싶다.
  //관련자료: https://www.codedaily.io/tutorials/How-to-Bridge-an-Objective-C-View-Component
  NSLog(@"[HelloCauly]RCTCaulyInterstitialAdModule initWithParentViewController() finish.");
}
// 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
// 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
RCT_EXPORT_METHOD(onDidReceiveInterstitialAd: (RCTResponseSenderBlock)callback){
  _receiveInterstitialAd = callback;
}
// 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
// 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
RCT_EXPORT_METHOD(onDidFailToReceiveInterstitialAd: (RCTResponseSenderBlock)callback){
  _failToReceiveInterstitialAd = callback;
}
// 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
// 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
RCT_EXPORT_METHOD(onWillShowInterstitialAd: (RCTResponseSenderBlock)callback){
  _willShowInterstitialAd = callback;
}
// 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
// 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
RCT_EXPORT_METHOD(onCloseInterstitialAd: (RCTResponseSenderBlock)callback){
  _closeInterstitialAd = callback;
}

// 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
// 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
RCT_EXPORT_METHOD(startInterstitialAdRequest){
  NSLog(@"[HelloCauly]CaulyInterstitialAd startInterstitialAdRequest() start.");
  [_caulyInterstitialAd startInterstitialAdRequest];
  NSLog(@"[HelloCauly]CaulyInterstitialAd startInterstitialAdRequest() finish.");
}
RCT_EXPORT_METHOD(show){
    [self.caulyInterstitialAd show];
}

#pragma - CaulyInterstitialAdDelegate
- (void)didReceiveInterstitialAd:(CaulyInterstitialAd *)interstitialAd isChargeableAd:(BOOL)isChargeableAd{
  NSLog(@"[HelloCauly]didReceiveInterstitialAd");
  // js로 이벤트 전달
  // 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
  // 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
  NSArray *events = [NSArray arrayWithObject:@(isChargeableAd)];
  _receiveInterstitialAd(@[[NSNull null], events]);
}
- (void)didFailToReceiveInterstitialAd:(CaulyInterstitialAd *)interstitialAd errorCode:(int)errorCode errorMsg:(NSString *)errorMsg{
  NSLog(@"[HelloCauly]didFailToReceiveInterstitialAd");
  // TODO js로 이벤트 전달
  // 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
  // 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
  // NSArray *events = [NSArray arrayWithObject:@(errorCode), @(errorMsg)]; // 에러남. 다른 데이터타입을 NSArray에 넣을 수 잇는지 확인 중. 또는 NSArray 말고 NSDictionary를 인자로 넣으면 안되는지 확인 필요.
  NSArray *events = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%i", errorCode], errorMsg, nil];
  _failToReceiveInterstitialAd(@[events, [NSNull null]]);
}
- (void)willShowInterstitialAd:(CaulyInterstitialAd *)interstitialAd{
  NSLog(@"[HelloCauly]willShowInterstitialAd");
  // TODO js로 이벤트 전달
  // 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
  // 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
  _willShowInterstitialAd(@[[NSNull null], [NSNull null]]);
}
- (void)didCloseInterstitialAd:(CaulyInterstitialAd *)interstitialAd{
  NSLog(@"[HelloCauly]didCloseInterstitialAd");
  self.caulyInterstitialAd = nil;
  // TODO js로 이벤트 전달
  // 콜백구현은 https://reactnative.dev/docs/native-modules-ios 참고
  // 콜백구현은 https://www.devh.kr/2020/Native-Modules-iOS/
  _closeInterstitialAd(@[[NSNull null], [NSNull null]]);
}

// 중요!!
// RCTBridgeModule에 export 된 모든 메서드들이 main queue에서 놀게끔 전역 설정하는 코드
// 참고 : https://www.devh.kr/2020/Native-Modules-iOS/ 의 Threading 부분 참고!
- (dispatch_queue_t)methodQueue{
  return dispatch_get_main_queue();
}
@end
