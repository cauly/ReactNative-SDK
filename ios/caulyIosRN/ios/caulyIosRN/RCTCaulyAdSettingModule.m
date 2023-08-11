//
//  RCTCaulyAdSettingModule.m
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//

#import <Foundation/Foundation.h>
#import "RCTCaulyAdSettingModule.h"


// 헤더파일 가져오기
@implementation RCTCaulyAdSettingModule

/* 네이티브 모듈 내보내는 메서드
 인자로 모듈의 이름을 지정한다.
 인자를 지정하지 않으면, 클래스 이름에서 RCT를 제외한 부분을 이름으로 사용한다 (CaulyModule)
 인자를 문자열 ""로 지정하지 말것!
*/
RCT_EXPORT_MODULE();

// js에서 호출 가능한 메서드 만들기
RCT_EXPORT_METHOD(initialize: (NSString *)identifier appCode: (NSString *)code animType:(int)animation adSize:(int)size reloadTime:(int)reloadTime useDynamicReloadTime:(BOOL)useDynamicReload closeOnLanding:(BOOL)closeLanding logLevel:(int)logLevel){
  
  NSLog(@"[HelloCauly]CaulyAdSetting for RN has been started.");
  
  _adSetting = [CaulyAdSetting globalSetting];
  
  // 카울리 로그 레벨
  [CaulyAdSetting setLogLevel:CaulyLogLevelTrace];
  
  // iTunes App ID
  _adSetting.appId = identifier;
  
  // 카울리 앱 코드
  _adSetting.appCode = code;
  
  // 화면 전환 효과
  _adSetting.animType = animation;
  
  // 광고 View 크기
  _adSetting.adSize = size;
  
  // 광고 자동 갱신 시간 (기본값)
  _adSetting.reloadTime = reloadTime;
  
  // 광고 자동 갱신 사용 여부 (기본값)
  _adSetting.useDynamicReloadTime = useDynamicReload;
  
  // 광고 랜딩 시 WebView 제거 여부
  _adSetting.closeOnLanding = closeLanding;
  
  NSLog(@"[HelloCauly]CaulyAdSetting for RN has been finished successfully.");
}

RCT_EXPORT_METHOD(setAppId: (NSString *)identifier){
  NSLog(@"[HelloCauly]CaulyAdSetting setAppId() called.");
  // iTunes App ID
  _adSetting.appId = identifier;
  NSLog(@"[HelloCauly]CaulyAdSetting setAppId() finish.");
}
RCT_EXPORT_METHOD(setAppCode: (NSString *)code){
  NSLog(@"[HelloCauly]CaulyAdSetting setAppCode() called.");
  // 카울리 앱 코드
  _adSetting.appCode = code;
  NSLog(@"[HelloCauly]CaulyAdSetting setAppCode() finish.");
}

RCT_EXPORT_METHOD(setAnimationType: (int)animation){
  NSLog(@"[HelloCauly]CaulyAdSetting setAnimationType() called.");
  // 화면 전환 효과
  _adSetting.animType = animation;
  NSLog(@"[HelloCauly]CaulyAdSetting setAnimationType() finish.");
}
RCT_EXPORT_METHOD(setAdSize: (int)size){
  NSLog(@"[HelloCauly]CaulyAdSetting setAdSize() called.");
  // 광고 View 크기
  _adSetting.adSize = size;
  NSLog(@"[HelloCauly]CaulyAdSetting setAdSize() finish.");
}
RCT_EXPORT_METHOD(setUseDynamicReloadTime: (int)reloadTime){
  NSLog(@"[HelloCauly]CaulyAdSetting setUseDynamicReloadTime() called.");
  // 광고 자동 갱신 시간 (기본값)
  _adSetting.reloadTime = reloadTime;
  NSLog(@"[HelloCauly]CaulyAdSetting setUseDynamicReloadTime() finish.");
}
RCT_EXPORT_METHOD(setUseDynamicReload: (BOOL)useDynamicReload){
  NSLog(@"[HelloCauly]CaulyAdSetting setUseDynamicReload() called.");
  // 광고 자동 갱신 사용 여부 (기본값)
  _adSetting.useDynamicReloadTime = useDynamicReload;
  NSLog(@"CaulyAdSetting setUseDynamicReload() finish.");
}
RCT_EXPORT_METHOD(setCloseOnLanding: (BOOL)closeLanding){
  NSLog(@"[HelloCauly]CaulyAdSetting setCloseOnLanding() called.");
  // 광고 랜딩 시 WebView 제거 여부
  _adSetting.closeOnLanding = closeLanding;
  NSLog(@"[HelloCauly]CaulyAdSetting setCloseOnLanding() finish.");
}

// Cauly 에서 사용하는 Enum타입을 상수로 내보내기
- (NSDictionary *)constantsToExport{
  return @{
    @"ANIMATION_TYPE_NONE": @(CaulyAnimNone),
    @"ANIMATION_TYPE_CURL_UP": @(CaulyAnimCurlUp),
    @"ANIMATION_TYPE_CURL_DOWN": @(CaulyAnimCurlDown),
    @"ANIMATION_TYPE_FADE_OUT": @(CaulyAnimFadeOut),
    @"ANIMATION_TYPE_FLIP_FROM_LEFT": @(CaulyAnimFlipFromLeft),
    @"ANIMATION_TYPE_FLIP_FROM_RIGHT": @(CaulyAnimFlipFromRight),
    @"AD_SIZE_IPHONE": @(CaulyAdSize_IPhone),
    @"AD_SIZE_IPAD_LARGE": @(CaulyAdSize_IPadLarge),
    @"AD_SIZE_IPAD_SMALL": @(CaulyAdSize_IPadSmall),
    @"RELOAD_TIME_0": @(CaulyReloadTime_0),
    @"RELOAD_TIME_30": @(CaulyReloadTime_30),
    @"RELOAD_TIME_60": @(CaulyReloadTime_60),
    @"RELOAD_TIME_120": @(CaulyReloadTime_120),
    @"LOG_LEVEL_INFO": @(CaulyLogLevelInfo),
    @"LOG_LEVEL_DEBUG": @(CaulyLogLevelDebug),
    @"LOG_LEVEL_ERROR": @(CaulyLogLevelError),
    @"LOG_LEVEL_TRACE": @(CaulyLogLevelTrace)
  };
}
// 모듈이 js 코드를 실행하기 전에, main 쓰레드에서 상수 초기화 하기
+ (BOOL)requiresMainQueueSetup{
  return YES;
}
@end
