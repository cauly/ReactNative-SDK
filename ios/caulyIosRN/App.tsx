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
  CaulyAdSettingModule.setAppCode('YOUR_APP_CODE');
  CaulyAdSettingModule.setCloseOnLanding(true);
  // 파라미터에 현재 react native 뷰객체를 넘겨줘야 한다. 넘기는 방법은 https://reactnative.dev/docs/0.68/communication-ios 참고해봐야 할듯 
  // https://s-pace.github.io/react-native/docs/integration-with-existing-apps.html
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
        'YOUR_APP_CODE',
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
