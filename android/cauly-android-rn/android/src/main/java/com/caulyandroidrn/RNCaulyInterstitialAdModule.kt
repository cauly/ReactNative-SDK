package com.caulyandroidrn

import android.util.Log
import com.fsn.cauly.CaulyInterstitialAdListener
import com.fsn.cauly.CaulyInterstitialAd

import com.fsn.cauly.CaulyAdInfoBuilder
import com.facebook.react.modules.core.DeviceEventManagerModule.RCTDeviceEventEmitter

import com.facebook.react.bridge.*
import com.facebook.react.bridge.UiThreadUtil.runOnUiThread

class RNCaulyInterstitialAdModule(context: ReactApplicationContext?) :
    ReactContextBaseJavaModule(context), CaulyInterstitialAdListener {
    private var caulyInterstitialAd: CaulyInterstitialAd? = null
    override fun getName(): String {
        return REACT_CLASS_NAME
    }

    @ReactMethod
    fun initWithParentViewController(appCode: String) {
        Log.e(REACT_CLASS_NAME, "initWithParentViewController with appCode: $appCode")
        Log.e(
            REACT_CLASS_NAME,
            "getReactApplicationContext().getCurrentActivity() : " + reactApplicationContext.currentActivity
        )
        // CaulyAdInfo 생성
        val adInfo = CaulyAdInfoBuilder(appCode)
            .build()

        // 전면 광고 생성
        caulyInterstitialAd = CaulyInterstitialAd()
        caulyInterstitialAd!!.setAdInfo(adInfo)
        caulyInterstitialAd!!.setInterstialAdListener(this)
        caulyInterstitialAd!!.disableBackKey()

        // 광고 요청. 광고 노출은 CaulyInterstitialAdListener의 onReceiveInterstitialAd에서 처리한다.
        runOnUiThread {
            caulyInterstitialAd!!.requestInterstitialAd(reactApplicationContext.currentActivity)
        }
    }

    private fun sendEvent(eventName: String, params: WritableMap?) {
        reactApplicationContext
            .getJSModule(RCTDeviceEventEmitter::class.java)
            .emit(eventName, params)
    }

    @ReactMethod
    fun addListener(eventName: String?) {
        //TODO NOTHING
    }

    @ReactMethod
    fun show() {
        runOnUiThread {
            caulyInterstitialAd!!.show()
        }
    }

    override fun onReceiveInterstitialAd(caulyInterstitialAd: CaulyInterstitialAd, b: Boolean) {
        Log.e(REACT_CLASS_NAME, "onReceiveInterstitialAd")
        this.caulyInterstitialAd = caulyInterstitialAd
        val params = Arguments.createMap()
        params.putBoolean("result", b)
        sendEvent("onDidReceiveInterstitialAd", params)
    }

    override fun onFailedToReceiveInterstitialAd(
        caulyInterstitialAd: CaulyInterstitialAd,
        i: Int,
        errorMessage: String
    ) {
        Log.e(
            REACT_CLASS_NAME,
            "onFailedToReceiveInterstitialAd errorCode:$i, errorMessage:$errorMessage"
        )
        val params = Arguments.createMap()
        params.putInt("_error", i)
        params.putString("result", errorMessage)
        sendEvent("onDidFailToReceiveInterstitialAd", params)
    }

    override fun onClosedInterstitialAd(caulyInterstitialAd: CaulyInterstitialAd) {
        Log.e(REACT_CLASS_NAME, "onClosedInterstitialAd")
        val params = Arguments.createMap()
        sendEvent("onDidCloseInterstitialAd", params)
    }

    override fun onLeaveInterstitialAd(caulyInterstitialAd: CaulyInterstitialAd) {
        Log.e(REACT_CLASS_NAME, "onLeaveInterstitialAd")
        val params = Arguments.createMap()
        sendEvent("onDidLeaveInterstitialAd", params)
    }

    companion object {
        private val REACT_CLASS_NAME = RNCaulyInterstitialAdModule::class.java.simpleName
    }
}
