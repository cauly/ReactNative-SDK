package com.caulyandroidrn

import android.content.Context
import com.fsn.cauly.CaulyAdView

class RNCustomCaulyAdView(context: Context) : CaulyAdView(context) {

    private var onClickAdviewListener: OnClickAdViewListener? = null;

    fun setOnClickAdViewListener(listener: OnClickAdViewListener?) {
        this.onClickAdviewListener = listener;
    }

    override fun onClickAd() {
        super.onClickAd()
        this.onClickAdviewListener?.onClickAd()
    }

    override fun reload() {
        super.reload()
    }
}

interface OnClickAdViewListener {
    fun onClickAd()
}
