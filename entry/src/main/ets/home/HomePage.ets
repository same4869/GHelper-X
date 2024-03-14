import bridge from '@arkui-x.bridge';
import deviceInfo from '@ohos.deviceInfo';
import { MToast } from '../utils/MToast';
import { MLog } from '../utils/log/MLog';

@Component
export struct HomePage {
  private bridgeImpl: bridge.BridgeObject | null = null;

  aboutToAppear(): void {
    MLog.debug('aboutToAppear')
    let osName: string = deviceInfo.osFullName;
    console.log('osName = ' + osName);
    MLog.debug('osName = ' + osName)
    if (osName.startsWith('Android')) {
      this.bridgeImpl = bridge.createBridge("Bridge");
      // Android应用平台上业务逻辑
    } else if (osName.startsWith('iOS')) {
      this.bridgeImpl = bridge.createBridge("Bridge")
      // iOS应用平台上业务逻辑
    } else if (osName.startsWith('OpenHarmony')){
      // OpenHarmony应用平台上业务逻辑
    }
    MLog.debug('this.bridgeImpl = ' + this.bridgeImpl)
  }

  onPageShow(): void {
    MLog.debug('onPageShow')
    // let osName: string = deviceInfo.osFullName;
    // console.log('osName = ' + osName);
    // MLog.debug('osName = ' + osName)
    // if (osName.startsWith('Android')) {
    //   this.bridgeImpl = bridge.createBridge("Bridge");
    //   // Android应用平台上业务逻辑
    // } else if (osName.startsWith('iOS')) {
    //   this.bridgeImpl = bridge.createBridge("Bridge")
    //   // iOS应用平台上业务逻辑
    // } else if (osName.startsWith('OpenHarmony')){
    //   // OpenHarmony应用平台上业务逻辑
    // }
    // MLog.debug('this.bridgeImpl = ' + this.bridgeImpl)
  }

  build() {
    Column() {
      Text("今天的天气真呀真真好").fontSize(16)
      Button("向安卓发送").onClick(event => {
        MToast.showToast("向安卓发送2")
        console.log("向安卓发送: 2222")
        MLog.debug("向安卓发送: 2222")
        if (this.bridgeImpl != null) {
          MToast.showToast("向安卓发送")
          console.log("向安卓发送")
          MLog.debug("向安卓发送")
          this.bridgeImpl.sendMessage("msg to Android").then((res) => {
            console.log("response: " + res)
            MLog.debug("response: " + res)
            MToast.showToast("收到android response: " + res)
          }).catch((err: string) => {
            console.log("error: " + JSON.stringify(err))
            MLog.debug("error: " + JSON.stringify(err))
            MToast.showToast("收到android err: " + err)
          })
        }
      })
    }.height("100%").width("100%").backgroundColor("#00ffff")
  }
}