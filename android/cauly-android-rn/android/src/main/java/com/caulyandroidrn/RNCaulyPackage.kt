package com.caulyandroidrn

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager
import java.util.ArrayList


class RNCaulyPackage : ReactPackage {
  private var rnCaulyAdSettingModule: RNCaulyAdSettingModule? = null
  override fun createNativeModules(reactApplicationContext: ReactApplicationContext): List<NativeModule> {
    val modules: MutableList<NativeModule> = ArrayList()
    rnCaulyAdSettingModule = RNCaulyAdSettingModule(reactApplicationContext)
    modules.add(rnCaulyAdSettingModule!!)
    modules.add(RNCaulyInterstitialAdModule(reactApplicationContext))
    return modules
  }

  // Expose Java components to JavaScript
  override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
    return listOf<ViewManager<*, *>>(RNCaulyAdView(rnCaulyAdSettingModule))
  }
}
