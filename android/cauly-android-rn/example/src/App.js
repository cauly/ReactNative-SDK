import { AnimationType, CaulyBannerAd, CaulyInterstitialAd, } from '../../src';
import React, { useCallback, useMemo, useState } from 'react';
import { Button, StyleSheet, View } from 'react-native';
import useInterval from './useInterval';
// 스타일 정의
const styles = StyleSheet.create({
    mainViewStyle: {
        flex: 1,
        marginTop: 50,
    },
    contentViewStyle: {
        alignItems: 'center',
        justifyContent: 'center',
    },
});
const App = () => {
    const [message, setMessage] = useState('');
    const [isReload, setReload] = useState(false);
    useInterval(() => {
        if (message.length === 0) {
            setMessage('123');
            setReload(true);
        }
        else {
            setMessage('');
            setReload(false);
        }
    }, 2000);
    const onPressInterstitialRequestButton = useCallback(() => {
        const caulyInterstitialAd = new CaulyInterstitialAd('tIw5rIqr');
        caulyInterstitialAd.addEventListener('onDidReceiveInterstitialAd', () => {
            console.warn('[App.js] js did register interstitial successfully! ');
            caulyInterstitialAd.show();
        });
        caulyInterstitialAd.addEventListener('onDidFailToReceiveInterstitialAd', () => {
            console.warn('[App.js] js did register interstitial failed.. ');
        });
        caulyInterstitialAd.addEventListener('onDidCloseInterstitialAd', () => {
            console.warn('[App.js] js did register onDidCloseInterstitialAd!!');
        });
        caulyInterstitialAd.addEventListener('onDidLeaveInterstitialAd', () => {
            console.warn('[App.js] js did register onDidLeaveInterstitialAd!!');
        });
    }, []);
    const caulyBanner = useMemo(() => {
        return (React.createElement(CaulyBannerAd, { appCode: "OjELN7RY", animationType: AnimationType.TOP_SLIDE, reload: isReload, 
            // adSizeType={BannerAdSize.SQUARE}
            isSetBannerWidthAndHeightByUser: true, 
            // bannerWidth={320}
            // bannerHeight={50}
            onDidReceiveBannerAd: () => {
                console.log('onDidReceiveBannerAd');
            }, onDidFailToReceiveBannerAd: () => {
                console.log('onDidFailToReceiveBannerAd');
            }, onWillShowBannerLandingView: () => {
                console.log('onWillShowBannerLandingView');
            }, onDidCloseBannerLandingView: () => {
                console.log('onDidCloseBannerLandingView');
            }, onClickAd: () => {
                console.log('click!!!!!!!');
            } }));
    }, [isReload]);
    return (React.createElement(View, { style: styles.mainViewStyle },
        React.createElement(View, { style: styles.contentViewStyle },
            React.createElement(Button, { title: "Interstitial request", onPress: onPressInterstitialRequestButton })),
        caulyBanner));
};
export default App;
