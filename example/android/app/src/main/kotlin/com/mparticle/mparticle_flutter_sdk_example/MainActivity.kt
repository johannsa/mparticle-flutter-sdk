package com.mparticle.mparticle_flutter_sdk_example

import android.app.Application
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import com.mparticle.MParticle
import com.mparticle.MParticleOptions

class ExampleApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        val options = MParticleOptions.builder(this)
                .logLevel(MParticle.LogLevel.VERBOSE)
            .credentials("us1-4476f90ffeb6044886c34dc0c3a6b9b4", "ad4yHpxpRVxSLi6cHeA7ZxgHySVmoY_bZQp1G3QPq1mFeMXOqpP9_WF6pXYazVxw")
                .build()
        MParticle.start(options)
    }

}



class MainActivity: FlutterActivity() {
}