package com.caulyandroidrn

import android.content.Context

import com.facebook.react.uimanager.ThemedReactContext

import android.widget.FrameLayout
import com.facebook.react.uimanager.UIManagerModule

class RNWrapperView(context: Context?) : FrameLayout(context!!) {
    override fun requestLayout() {
        super.requestLayout()
        post(measureAndLayout)
    }

    private val measureAndLayout = Runnable {

        measure(
            MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
            MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY)
        )
        layout(left, top, right, bottom)
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        var maxWidth = 0
        var maxHeight = 0
        for (i in 0 until childCount) {
            val child = getChildAt(i)
            if (child.visibility != GONE) {
                child.measure(widthMeasureSpec, MeasureSpec.UNSPECIFIED)
                maxWidth = Math.max(maxWidth, child.measuredWidth)
                maxHeight = Math.max(maxHeight, child.measuredHeight)
            }
        }
        val finalWidth = Math.max(maxWidth, suggestedMinimumWidth)
        val finalHeight = Math.max(maxHeight, suggestedMinimumHeight)
        setMeasuredDimension(finalWidth, finalHeight)
        (context as ThemedReactContext).runOnNativeModulesQueueThread {
            (context as ThemedReactContext).getNativeModule(
                UIManagerModule::class.java
            )!!.updateNodeSize(id, finalWidth, finalHeight)
        }
    }
}
