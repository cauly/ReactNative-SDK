# 목차
1. [CAULY ReactNative 시작하기](#1-CAULY-ReactNative-시작하기)
    * [참고 사항](#참고-사항)
    * [권장 환경](#권장-환경)
    * [주의 사항](#주의-사항)
    * [SDK 구성](#SDK-구성)
    * [SDK 설치 방법](#SDK-설치-방법)

2. [배너 및 전면 광고 추가하기(XCode 진영 연결 코드)](#2-배너-및-전면-광고-추가하기(XCode-진영-연결-코드))
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyAdSettingModule.h 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyAdSettingModule.m 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyInterstitialAdModule.h 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyInterstitialAdModule.m 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdView.h 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdView.m 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdViewManager.h 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdViewManager.m 추가](#자세한-내용은-‘caulyIosRN’-참조)        
 
3. [배너 및 전면 광고 추가하기(js 진영 연결 코드)](#3-배너-및-전면-광고-추가하기(js-진영-연결-코드)) 
    * [ReactNative App 프로젝트루트경로/CaulyAdView.js 추가](#자세한-내용은-‘caulyIosRN’-참조)
    * [ReactNative App 프로젝트루트경로/App.tsx 추가](#자세한-내용은-‘caulyIosRN’-참조)

4. [실행하기](#4-실행하기)
    * [Flutter Plugin 프로젝트 실행을 위한 명령어 실행](#Flutter-Plugin-프로젝트-실행을-위한-명령어-실행)

- - - 
# 1. CAULY ReactNative 시작하기
이 프로젝트는 Cauly iOS SDK ReactNative 연동 예제 프로젝트입니다.
ReactNative 예제는 ReactNative App 프로젝트이며, iOS SDK 10.0, Objective C 기반으로 작성 되었습니다.

### 참고 사항
- Cauly SDK는 iOS SDK 10.0 기반으로 작성 되었습니다.
- 기존 프로젝트에 있던 과거 SDK를 깨끗하게 지운 후 설치해야 정상 동작 됩니다.
- 새 SDK를 설치해도 기존 Library를 참조하는 경우 다음 작업을 수행 합니다.
	- [Targets 에서 “Get Info”]
		- “Build Phase” 탭 에서 Linked Libraries에 기존 라이브러리가 포함된 게 있다면 삭제 합니다.
		- “Build Settings” 탭에서 “Library Search Paths” 검색하여 불필요한 경로 삭제 합니다.
				원하는 경로가 제일 위로 가야 합니다.
- 배너광고 최소 요청 주기 15 초 입니다.

### 권장 환경
- Xcode 13.2.1 이상 사용
- iOS 10.0 이상 타겟팅

### 주의 사항
- SKAdNetwork 지원
	- Info.plist 파일에 SKAdNetworkItems 키를 추가하고 Cauly (55644vm79v.skadnetwork) 에 대한 SKAdNetworkIdentifier 값과 함께 Cauly 의 파트너 DSP 의 SKAdNetworkIdentifier 값을 추가합니다.
	- 즉, Info.plist 파일에 아래 내용을 추가해주시면 Cauly 와 Cauly 를 통한 다른 DSP 의 광고가 정상적으로 처리될 수 있습니다.
		
	```xml
	<key>SKAdNetworkItems</key>
	<array>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>55644vm79v.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>4fzdc2evr5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>4pfyvq9l8r.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>v72qych5uu.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>6xzpu9s2p8.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>ludvb6z3bs.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>mlmmfzh3r3.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>294l99pt4k.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>24t9a8vw3c.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>hs6bdukanm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>cstr6suwn9.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>54nzkqm89y.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>wzmmz9fp6w.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>yclnxrl5pm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>7ug5zh24hu.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>feyaarzu9v.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>kbd757ywx3.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>275upjj5gd.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>9t245vhmpl.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>44jx6755aq.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>tl55sbb4fm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>2u9pt9hc89.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>8s468mfl3y.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>74b6s63p6l.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>uw77j35x4d.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>gvmwg8q7h5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>gta9lk7p23.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>32z4fx6l9h.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>3rd42ekr43.skadnetwork</string>
		</dict>
	</array>
	```	

- iOS9 ATS(App Transport Security) 처리
	- 애플은 iOS9 에서 ATS(App Transport Security)라는 기능을 제공합니다. 기기에서 ATS 활성화 시 암호화된 HTTPS 방식만 허용됩니다. HTTPS 방식을 적용하지 않을 경우 애플 보안 기준을 충족하지 않는다는 이유로 광고가 차단될 수 있습니다.
	- 모든 광고가 HTTPS 방식으로 호출되지 않으므로, info.plist 파일에 아래 설정을 적용하여 사용 부탁 드립니다.
	- (추가) 2017년 1월 이후 ATS를 활성화한 앱에 대해서만 앱스토어에 등록할 수 있도록한 애플 정책이 수립되었습니다. 따라서 기존 설정과 함께 추가적인 설정을 추가하여야 합니다.
	
	```xml
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
	```

	- BGM이 포함된 광고가 있을 수 있으니, APP에 BGM이 있는 경우 willShowLandingView API를 이용하여 일시 중지 해주세요, 그리고 광고 종료 후 didCloseLandingView API를 이용하여 BGM을 재 시작 하시면 됩니다.
	- 광고뷰가 화면에 보여지지 않는 경우에도 광고 요청을 할 수 있습니다. 광고 요청을 중단하고자 할 때 [CaulyAdView 객체 stopAdRequest]; 명령을 실행하여 광고 요청을 반드시 중지하기 바랍니다.
	- libCauly-universal.a 는 simulator와 device 통합된 파일 입니다. 
	- libCauly.a, libCauly-universal.a, Cauly.xcframework 파일 중 환경에 맞는 파일을 사용하시면 됩니다.


- iOS14 ATT(App Tracking Transparency) Framework 적용
	- 애플은 iOS14 에서 ATT(App Tracking Transparency) Framework가 추가되었습니다.
	- IDFA 식별자를 얻기 위해서는 `ATT Framework를 반드시 적용`해야 합니다.
	- `info.plist`
	```xml
	<key> NSUserTrackingUsageDescription </key>
	<string> 맞춤형 광고 제공을 위해 사용자의 데이터가 사용됩니다. </string>
	```

	- `ViewController.m`
	```objectivec
	#import <AppTrackingTransparency/AppTrackingTransparency.h>
	...
	if (@available(iOS 14, *)) {
    [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        switch (status) {
            // 승인
            case ATTrackingManagerAuthorizationStatusAuthorized:
                break;
            // 거부
            case ATTrackingManagerAuthorizationStatusDenied:
                break;
            // 제한
            case ATTrackingManagerAuthorizationStatusRestricted:
                break;
            // 미결정
            default:
                break;
        	}
        }];
	}
	```

- 사용자 앱 내 광고 경험 개선을 위한 URL Scheme 적용
	- info.plist 작성
	```xml
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>naversearchapp</string>
	</array>
	```

### SDK 구성
- Cauly SDK 헤더 파일

| 파일명                   | 설명                       |
|-----------------------|--------------------------|
| Cauly.h               | Cauly SDK 공용 헤더 파일       |
| CaulyAdSetting.h      | Cauly 광고 세팅 클래스 헤더 파일    |
| CaulyAdView.h         | 광고 광고 클래스 및 프로토콜 헤더 파일   |
| CaulyInterstitialAd.h | 전면 광고 클래스 및 프로토콜 헤더 파일   |
| CaulyNativeAd.h       | 네이티브 광고 클래스 및 프로토콜 헤더 파일 |
| CaulyNativeAdItem.h   | 네이티브 광고 아이템 헤더 파일        |

- Cauly SDK 라이브러리 파일

| 파일명                  | 설명                                   |
|----------------------|--------------------------------------|
| libCauly.a           | Cauly SDK 라이브러리 파일 (디바이스 전용)         |
| libCauly-universal.a | Cauly SDK 라이브러리 파일 (시뮬레이터 및 디바이스 통합) |
| Cauly.xcframework    | Cauly SDK Framework 파일	(ARM64 계열 macOS 지원)	|
		
- Cauly SDK 샘플 프로젝트

  - Objective-C Project
  - Swift Project
	
## SDK 설치 방법
1. Cauly SDK 추가
	- Cauly SDK 를 적용할 프로젝트 내에 ‘CaulyLib’ 폴더 복사
	- Cauly.xcframework 추가 (ARM64 계열`M1, M2` macOS 지원)
2. Framework 추가
	- AVKit.framework
	- UIKit.framework
	- Foundation.framework
	- CoreGraphics.framework
	- QuartzCore.framework
	- SystemConfiguration.framework
	- MediaPlayer.framework
	- CFNetwork.framework
	- MessageUI.framework  //‘Required’ 를 ‘Optional’로 변경해야 합니다.
	- EventKit.framework    // ‘Required’ 를 ‘Optional’로 변경해야 합니다.
	- AdSupport.Framwork  // ‘Required’ 를 ‘Optional’로 변경해야 합니다.









# 2. 배너 및 전면 광고 추가하기(안드로이드 진영 연결 코드)

XCode의 Objective C 파일은 Cauly iOS SDK의 기능인 배너 및 전면 광고 호출하는 역할을 담당합니다.
js 파일에는 사용자와 상호작용할 수 있는 UI코드가 들어가며, Objective C 파일은 사용자가 UI를 통해 배너 및 전면 광고를 호출한 것과 일치하는 Cauly iOS SDK 를 호출할 수 있습니다.
js 파일과 연결을 위해서 필요한 Objective C 파일을 만듭니다.(총 12개의 파일 구현이 필요)

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyAdSettingModule.h 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RCTCaulyAdSettingModule.h
//  RNCaulySample
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
```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyAdSettingModule.m 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RCTCaulyAdSettingModule.m
//  RNCaulySample
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
```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyInterstitialAdModule.h 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RCTCaulyInterstitialAdModule.h
//  RNCaulySample
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

```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RCTCaulyInterstitialAdModule.m 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RCTCaulyInterstitialAdModule.m
//  RNCaulySample
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
```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdView.h 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RNCaulyAdView.h
//  RNCaulySample
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

```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdView.m 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RNCaulyAdView.m
//  RNCaulySample
//

#import <Foundation/Foundation.h>
#import "RNCaulyAdView.h"

@implementation RNCaulyAdView

- (instancetype)initWithFrame:(CGRect)frame{
  NSLog(@"[HelloCauly]RNCaulyAdView initWithFrame()start.");
  if((self = [super initWithFrame:frame])){
    NSLog(@"[HelloCauly]CaulyAdView init() start.");
    _caulyAdView = [[CaulyAdView alloc] initWithParentViewController:self];
    NSLog(@"[HelloCauly]CaulyAdView init() finish.");
    NSLog(@"[HelloCauly]CaulyAdView addSubView() start.");
    [self addSubview:_caulyAdView];
    NSLog(@"[HelloCauly]CaulyAdView addSubView() finish.");
  }
  NSLog(@"[HelloCauly]RNCaulyAdView initWithFrame()finish.");
  return self;
}

// 있어도 그만, 없어도 그만.
- (void)layoutSubviews{
  [super layoutSubviews];
  NSLog(@"[HelloCauly]RNCaulyAdView layoutSubviews()start.");
  _caulyAdView.frame = self.bounds;
  NSLog(@"[HelloCauly]RNCaulyAdView layoutSubviews()finish.");
}

// 있어도 그만, 없어도 그만.
- (void)didMoveToWindow{
  NSLog(@"[HelloCauly]RNCaulyAdView didMoveToWindow()start.");
  NSLog(@"[HelloCauly]RNCaulyAdView didMoveToWindow()finish.");
}

@end
```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdViewManager.h 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RNCaulyAdViewManager.h
//  RNCaulySample
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

```

#### ReactNative App 프로젝트루트경로/ios/caulyIosRN/RNCaulyAdViewManager.m 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` objectivec
//
//  RNCaulyAdViewManager.m
//  RNCaulySample
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

```

# 3. 배너 및 전면 광고 추가하기(js 진영 연결 코드)

Objective C 파일을 완성하였다면, Objective C 파일을 호출할 js 파일을 만들어줍니다.
js 파일은 사용자와 직접 상호작용하는 UI코드가 포함되어 있으며, UI를 통해 사용자와 Objective C 파일 사이에서 일어나는 배너 및 전면 광고 호출 활동을 연결해주는 매개 역할을 합니다.

#### ReactNative App 프로젝트루트경로/CaulyAdView.js 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` js
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
// 프로젝트/App.js
import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent } from 'react-native';
const RNCaulyAdView = requireNativeComponent("RNCaulyAdView");

class CaulyAdView extends Component {
    render() {      
        return (
            <RNCaulyAdView 
                {...this.props}
            />
        );
    }
}

CaulyAdView.propTypes = {

}

export default CaulyAdView;
```

#### ReactNative App 프로젝트루트경로/App.tsx 추가 [자세한 내용은 ‘caulyIosRN’ 참조]
``` tsx
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import PropTypes from 'prop-types';
import {View, Button, StyleSheet, NativeModules } from 'react-native';
import CaulyAdView from './CaulyAdView';

// 상수 정의
const { CaulyAdSettingModule, CaulyInterstitialAdModule } = NativeModules;

// 스타일 정의
const styles = StyleSheet.create({
  mainViewStyle: {
      flex: 1,
      marginTop: 50
  },
  contentViewStyle: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center'                
  },
  footerViewStyle: {
      height: 50,
      width: '100%'
  },
  caulyAdViewStyle: {
      height: 50, 
      width: '100%', 
      backgroundColor: 'yellow'
  },
  buttonStyle: {
      position: 'relative',
      height: 500,
      alignItems: 'center',
      justifyContent: 'center'        
  }
});

// "Interstitial request" 버튼 이벤트 처리
function onPressInterstitialRequestButton(){
  CaulyAdSettingModule.setAppId('CAULY');
  CaulyAdSettingModule.setAppCode('YOUR_CAULY_CODE');
  CaulyAdSettingModule.setCloseOnLanding(true);
  CaulyInterstitialAdModule.initWithParentViewController(); 
  CaulyInterstitialAdModule.onDidReceiveInterstitialAd(() => {
      console.warn("[App.js] js did registerd onDidReceiveInterstitialAd successfully!!!");
      CaulyInterstitialAdModule.show();
  }); CaulyInterstitialAdModule.onDidFailToReceiveInterstitialAd(() => {
      console.warn("[App.js] js did registerd onDidFailToReceiveInterstitialAd successfully!!!");
  }); CaulyInterstitialAdModule.onWillShowInterstitialAd(() => {
      console.warn("[App.js] js did registerd onWillShowInterstitialAd successfully!!!");
  }); 
CaulyInterstitialAdModule.onCloseInterstitialAd(() => {
      console.warn("[App.js] js did registerd onCloseInterstitialAd successfully!!!");
  });

  CaulyInterstitialAdModule.startInterstitialAdRequest();
  
}

    // 카울리 배너 광고 수신 성공 시 이벤트 콜백 처리
 function _onDidReceiveBannerAd() {
      console.warn("[App.js]js did registered _onDidReceiveBannerAd successfully!!!" );
 }

  // 카울리 배너 광고 수신 실패 시 이벤트 콜백 처리
function _onDidFailToReceiveBannerAd() {
      console.warn("[App.js]js did registered _onDidFailToReceiveBannerAd successfully!!!");        
  }

  // 카울리 배너 광고 클릭하여 랜딩 페이지로 넘어갈 때 이벤트 콜백 처리(html5 소재의 배너 광고일 경우에만 적용)    
function _onWillShowBannerLandingView() {
      console.warn("[App.js]js did registered _onWillShowBannerLandingView successfully!!!");        
  }

  // 카울리 배너 광고 랜딩 페이지를 닫을 때 이벤트 콜백 처리(html5 소재의 배너 광고일 경우에만 적용)
function _onDidCloseBannerLandingView() {
      console.warn("[App.js]js did registered _onDidCloseBannerLandingView successfully!!!");        
  }
  
function _onDidReceiveInterstitialAd() {
      console.warn("[App.js] js did registerd _onDidReceiveInterstitialAd successfully!!!");
      CaulyInterstitialAdModule.show();
  }
  
function _onDidFailToReceiveInterstitialAd() {
      console.warn("[App.js] js did registerd _onDidFailToReceiveInterstitialAd successfully!!!");
  }
  
function _onWillShowInterstitialAd() {
      console.warn("[App.js] js did registerd _onWillShowInterstitialAd successfully!!!");
  }
function _onDidCloseInterstitialAd() {
      console.warn("[App.js] js did registerd _onCloseInterstitialAd successfully!!!");
  }

function App(): JSX.Element {

      // 카울리 iOS SDK 초기화 메서드를 브릿징하여 메시징
    CaulyAdSettingModule.initialize(
        'CAULY', // appId
        'YOUR_CAULY_CODE',
    CaulyAdSettingModule.ANIMATION_TYPE_NONE, //animation type : ANIMATION_TYPE_CURL_UP, ANIMATION_TYPE_CURL_DOWN, ANIMATION_TYPE_FADE_OUT, ANIMATION_TYPE_FLIP_FROM_LEFT, ANIMATION_TYPE_FLIP_FROM_RIGHT
        CaulyAdSettingModule.AD_SIZE_IPHONE, // adSize: AD_SIZE_IPHONE, AD_SIZE_IPAD_LARGE, AD_SIZE_IPAD_SMALL
        CaulyAdSettingModule.RELOAD_TIME_30, // reloadTime: RELOAD_TIME_0, RELOAD_TIME_30, RELOAD_TIME_60, RELOAD_TIME_120
        true, // useDynamicReloadTime: true or false
        true, // closeOnLanding: true or false
        CaulyAdSettingModule.LOG_LEVEL_TRACE // logLevel: LOG_LEVEL_INFO, LOG_LEVEL_DEBUG, LOG_LEVEL_ERROR, LOG_LEVEL_TRACE
    );
    
  return (
    <View style={styles.mainViewStyle}>
      <View style={styles.contentViewStyle}>
          <Button
              title = "Interstitial request"
              onPress = {onPressInterstitialRequestButton}/>
      </View>
      <View style={styles.footerViewStyle}>
          <CaulyAdView 
              style={styles.caulyAdViewStyle}        
              onDidReceiveBannerAd={_onDidReceiveBannerAd}
              onDidFailToReceiveBannerAd = {_onDidFailToReceiveBannerAd}
              onWillShowBannerLandingView = {_onWillShowBannerLandingView}
              onDidCloseBannerLandingView = {_onDidCloseBannerLandingView}>
          </CaulyAdView>            
      </View>
    </View>
  );
}

export default App;
```

# 4. 실행하기
마지막으로 실행을 위해 다음 명령어를 ReactNative App 프로젝트루트에서 실행합니다.

### ReactNative App 프로젝트 실행을 위한 명령어 실행
```
npx react-native run-ios
```