package com.caulyandroidrn

import android.content.Context
import android.util.Log

import com.facebook.react.uimanager.ViewGroupManager
import com.fsn.cauly.CaulyAdViewListener
import com.facebook.react.uimanager.ThemedReactContext
import com.fsn.cauly.CaulyAdView
import com.facebook.react.bridge.ReactContext
import com.facebook.react.uimanager.events.RCTEventEmitter
import com.facebook.react.common.MapBuilder
import com.facebook.react.uimanager.annotations.ReactProp

class RNCaulyAdView(private val rnCaulyAdSettingModule: RNCaulyAdSettingModule?) :
    ViewGroupManager<RNWrapperView>(), CaulyAdViewListener {
    private var rootView: RNWrapperView? = null
    private var context: ReactContext? = null
    override fun getName(): String {
        return REACT_CLASS_NAME
    }

    public override fun createViewInstance(reactContext: ThemedReactContext): RNWrapperView {
        rootView = RNWrapperView(reactContext)
        context = reactContext
        Log.e(REACT_CLASS_NAME, "rootView created.")

        // CaulyAdInfo를 이용, CaulyAdView 생성.
        val caulyAdView = RNCustomCaulyAdView(reactContext.currentActivity as Context)
        caulyAdView.setAdInfo(rnCaulyAdSettingModule!!.bannerCaulyAdInfo)
        caulyAdView.setAdViewListener(this)
        caulyAdView.setOnClickAdViewListener(object : OnClickAdViewListener {
            override fun onClickAd() {
                Log.e(REACT_CLASS_NAME, "onClickAd()")
                if (context is ReactContext) {
                    context!!.getJSModule(RCTEventEmitter::class.java).receiveEvent(
                        rootView!!.id, "onClickAd", null
                    )
                }
            }
        })
        Log.e(REACT_CLASS_NAME, "caulyAdView created.")
        rootView!!.addView(caulyAdView)
        Log.e(REACT_CLASS_NAME, "caulyAdView is attached to rootView.")
        return rootView!!
    }

    override fun onReceiveAd(caulyAdView: CaulyAdView, b: Boolean) {
        Log.e(REACT_CLASS_NAME, "onReceiveAd()")
        Log.e("junhojohn", "onReceiveAd() context: " + context)
        if (context is ReactContext) {
            context!!.getJSModule(RCTEventEmitter::class.java).receiveEvent(
                rootView!!.id, "onReceiveAd", null
            )
        }
    }

    override fun onFailedToReceiveAd(caulyAdView: CaulyAdView, i: Int, s: String) {
        Log.e(REACT_CLASS_NAME, "onFailedToReceiveAd()")
        if (context is ReactContext) {
            context!!.getJSModule(RCTEventEmitter::class.java).receiveEvent(
                rootView!!.id, "onFailedToReceiveAd", null
            )
        }
    }

    override fun onShowLandingScreen(caulyAdView: CaulyAdView) {
        Log.e(REACT_CLASS_NAME, "onShowLandingScreen()")
        if (context is ReactContext) {
            context!!.getJSModule(RCTEventEmitter::class.java).receiveEvent(
                rootView!!.id, "onShowLandingScreen", null
            )
        }
        //        WritableMap event = Arguments.createMap();
//        event.putLong("", 1);
//        ReactContext reactContext = (ReactContext) caulyAdView.getContext();
//        reactContext.getJSModule(RCTEventEmitter.class)
//                .receiveEvent(1, "onShowLandingScreen", event);
    }

    override fun onCloseLandingScreen(caulyAdView: CaulyAdView) {
        Log.e(REACT_CLASS_NAME, "onCloseLandingScreen()")
        if (context is ReactContext) {
            context!!.getJSModule(RCTEventEmitter::class.java).receiveEvent(
                rootView!!.id, "onCloseLandingScreen", null
            )
        }
    }

    override fun getExportedCustomDirectEventTypeConstants(): Map<String, Any>? {
        Log.e(REACT_CLASS_NAME, "getExportedCustomDirectEventTypeConstants()")
        return MapBuilder.builder<String, Any>().put(
            "onReceiveAd", MapBuilder.of("registrationName", "onDidReceiveBannerAd")
        ).put(
            "onFailedToReceiveAd",
            MapBuilder.of("registrationName", "onDidFailToReceiveBannerAd")
        ).put(
            "onShowLandingScreen",
            MapBuilder.of("registrationName", "onWillShowBannerLandingView")
        ).put(
            "onCloseLandingScreen",
            MapBuilder.of("registrationName", "onDidCloseBannerLandingView")
        ).put(
            "onClickAd",
            MapBuilder.of("registrationName", "onClickAd")
        ).build()
    }

    @ReactProp(name = "reload")
    fun reloadBanner(rnWrapperView: RNWrapperView, reload: Boolean) {
        if (reload) {
            Log.e(REACT_CLASS_NAME, "reloadBanner()")
            var caulyAdView: CaulyAdView = rnWrapperView.getChildAt(0) as CaulyAdView;
            caulyAdView.reload()
        }
    }

    companion object {
        private val REACT_CLASS_NAME = RNCaulyAdView::class.java.simpleName
    }
}
