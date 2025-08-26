//package com.example.virualapi
//
//import io.flutter.embedding.android.FlutterFragmentActivity
//
//class MainActivity: FlutterFragmentActivity()

package com.example.virualapi

import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import androidx.core.splashscreen.SplashScreen
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen

class MainActivity: FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Android 12+ Splash Screen API
        installSplashScreen()
        super.onCreate(savedInstanceState)
    }
}
