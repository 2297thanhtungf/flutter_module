package com.dut.mainproject;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.MethodChannel;

public class TestActivity extends FlutterActivity {
    String code;
    @Nullable
    @Override
    public FlutterEngine provideFlutterEngine(@NonNull Context context) {
        return FlutterEngineCache.getInstance().get("id_home");
    }

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        super.onNewIntent(intent);
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
         code = getIntent().getData().getQueryParameter("route");
        Log.d("intent-----","" + code);
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        flutterEngine.getNavigationChannel().setInitialRoute(code);
        super.configureFlutterEngine(flutterEngine);
        MethodChannel methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "com.dut.test_module/back");
        methodChannel.setMethodCallHandler(
                (call, result) -> {
                    switch (call.method){
                        case "listen_back_from_module":
                            result.success(true);
                            finish();
                            break;
                        default:
                            result.notImplemented();
                    }
                });
    }
}
