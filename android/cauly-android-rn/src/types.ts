import type { AnimationType, BannerAdSize } from './constants';

export interface BannerAdProps {
  onDidReceiveBannerAd?: () => void;
  onDidFailToReceiveBannerAd?: (error: Error) => void;
  onWillShowBannerLandingView?: () => void;
  onDidCloseBannerLandingView?: () => void;
  onClickAd?: () => void;
  reload?: boolean;
}

export interface InterstitialAdProps {
  onDidReceiveInterstitialAd?: () => void;
  onDidFailToReceiveInterstitialAd?: (error: Error) => void;
  onDidCloseInterstitialAd?: () => void;
  onDidLeaveInterstitialAd?: () => void;
}

export interface AdInfo {
  appCode: string;
  adSizeType?: typeof BannerAdSize | string;
  animationType?: typeof AnimationType | string;
  isSetBannerWidthAndHeightByUser?: boolean;
  bannerWidth?: number;
  bannerHeight?: number;
}
