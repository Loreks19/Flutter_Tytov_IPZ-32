package com.lntu.l0014.lab0014

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/native_code"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNativeData") {
                val nativeData = getNativeMessage()
                result.success(nativeData)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeMessage(): String {
        // Повертаємо фразу
        return "Hi my dear friend!"
    }
}

