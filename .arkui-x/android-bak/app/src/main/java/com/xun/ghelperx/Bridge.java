package com.xun.ghelperx;

import android.content.Context;
import android.util.Log;

import ohos.ace.adapter.capability.bridge.BridgePlugin;
import ohos.ace.adapter.capability.bridge.IMessageListener;

public class Bridge extends BridgePlugin implements IMessageListener {
    public Bridge(Context context, String name, int id) {
        super(context, name, id);
        Log.d("kkkkkkkk", "Bridge");
        setMessageListener(this);
    }

    // Android侧方法，供ArkUI侧调用
    public String getHelloArkUI() {
        return "Hello ArkUI!";
    }

    // 注册回调，接收ArkUI侧发来的数据
    @Override
    public Object onMessage(Object object) {
        Log.d("kkkkkkkk", "onMessage object:" + object.toString());
        return "java onMessage success";
    }

    @Override
    public void onMessageResponse(Object object) {
    }
}
