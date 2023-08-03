package com.caulyandroidrn

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.fsn.cauly.CaulyAdInfo
import com.fsn.cauly.CaulyAdInfoBuilder

class RNCaulyAdSettingModule(context: ReactApplicationContext?) :
  ReactContextBaseJavaModule(context) {
  var bannerCaulyAdInfo: CaulyAdInfo? = null
    private set

  override fun getName(): String {
    return REACT_CLASS_NAME
  }

  @ReactMethod
  fun initialize(
    appCode: String,
    isSetBannerWidthAndHeightByUser: Boolean,
    adSizeType: String,
    animationType: String,
    bannerWidth: Int,
    bannerHeight: Int
  ) {
    Log.e(
      REACT_CLASS_NAME,
      "appCode: " + appCode +
        ", isSetBannerWidthAndHeightByUser: " + isSetBannerWidthAndHeightByUser +
        ", adSizeType: " + adSizeType +
        ", animationType: " + animationType +
        ", bannerWidth: " + bannerWidth +
        ", bannerHeight: " + bannerHeight
    )
    bannerCaulyAdInfo = if (isSetBannerWidthAndHeightByUser) {
      // banner size 커스텀 세팅
      if (adSizeType == CaulyAdInfoBuilder.SQUARE) {
        Log.e(REACT_CLASS_NAME, "option1 적용.")
        CaulyAdInfoBuilder(appCode)
          .banner_interval(false)
          .dynamicReloadInterval(false)
          .bannerHeight(adSizeType)
          .setBannerSize(bannerWidth, bannerHeight)
          .effect(animationType)
          .build()
      } else {
        Log.e(REACT_CLASS_NAME, "option2 적용.")
        CaulyAdInfoBuilder(appCode)
          .bannerHeight(adSizeType)
          .setBannerSize(bannerWidth, bannerHeight)
          .effect(animationType)
          .build()
      }
    } else {
      // 320x50 고정일때
      if (adSizeType == CaulyAdInfoBuilder.SQUARE) {
        Log.e(REACT_CLASS_NAME, "option3 적용.")
        CaulyAdInfoBuilder(appCode)
          .banner_interval(false)
          .dynamicReloadInterval(false)
          .bannerHeight(adSizeType)
          .effect(animationType)
          .build()
      } else {
        Log.e(REACT_CLASS_NAME, "option4 적용.")
        CaulyAdInfoBuilder(appCode)
          .bannerHeight(adSizeType)
          .build()
      }
    }
  }

  companion object {
    private val REACT_CLASS_NAME = RNCaulyAdSettingModule::class.java.simpleName
  }
}
