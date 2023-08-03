import React, { useEffect } from 'react';
import { NativeModules, requireNativeComponent } from 'react-native';
import { AnimationType, BannerAdSize } from '../../constants';
import type { AdInfo, BannerAdProps } from '../../types';

const { RNCaulyAdSettingModule } = NativeModules;

const RNCaulyAdView = requireNativeComponent<BannerAdProps>('RNCaulyAdView');

const CaulyAdView: React.FC<BannerAdProps & AdInfo> = ({
  appCode,
  adSizeType = BannerAdSize.Adaptive,
  animationType = AnimationType.FADE_IN,
  isSetBannerWidthAndHeightByUser = false,
  bannerWidth = 320,
  bannerHeight = 50,
  onDidReceiveBannerAd,
  onDidFailToReceiveBannerAd,
  onWillShowBannerLandingView,
  onDidCloseBannerLandingView,
  onClickAd,
  reload,
}) => {
  useEffect(() => {
    RNCaulyAdSettingModule.initialize(
      appCode,
      isSetBannerWidthAndHeightByUser,
      adSizeType,
      animationType,
      bannerWidth,
      bannerHeight
    );
  }, []);

  return (
    <RNCaulyAdView
      onDidReceiveBannerAd={onDidReceiveBannerAd}
      onDidFailToReceiveBannerAd={onDidFailToReceiveBannerAd}
      onWillShowBannerLandingView={onWillShowBannerLandingView}
      onDidCloseBannerLandingView={onDidCloseBannerLandingView}
      onClickAd={onClickAd}
      reload={reload}
    />
  );
};

export default CaulyAdView;
