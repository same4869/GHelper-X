import { MLog } from '@comm/commonlib/Index';
/**
 * @Author: xwang
 * @Date: 2024/4/12 14:10
 * @Description: 悬浮窗管理
 **/
import { window } from '@kit.ArkUI'
import { BusinessError } from '@ohos.base';

const TAG = "[GiraffeFloatManager]"

class GiraffeFloatManager {
  windowStage_: window.WindowStage | null = null
  sub_windowClass: window.Window | null = null
  locationX = 20
  locationY = 1000
  size = 100

  init(windowStage: window.WindowStage) {
    this.windowStage_ = windowStage
  }

  //拖动结束的时候调这个方法，保证一定是贴边的
  updateLocationByEnd() {
    this.locationX = 20
    if (this.sub_windowClass != null) {
      this.sub_windowClass.moveWindowTo(this.locationX, this.locationY, (err: BusinessError) => {

        let errCode: number = err.code;
        if (errCode) {
          MLog.error(TAG, 'Failed to change the window size. Cause:' + JSON.stringify(err));
          return;
        }
        MLog.info(TAG, `save float locatio: ${this.locationX} ${this.locationY}`)
      });
    }
  }

  //拖动的时候调这个，跟随手指
  updateLocation(offSetX: number, offsetY: number) {
    if (this.sub_windowClass != null) {
      this.locationX = this.locationX + offSetX
      this.locationY = this.locationY + offsetY
      this.sub_windowClass.moveWindowTo(this.locationX, this.locationY, (err: BusinessError) => {

        let errCode: number = err.code;
        if (errCode) {
          MLog.error(TAG, 'Failed to change the window size. Cause:' + JSON.stringify(err));
          return;
        }
        MLog.info(TAG, `save float locatio: ${this.locationX} ${this.locationY}`)
      });
    }
  }

  show() {
    if (this.windowStage_ == null) {
      MLog.error(TAG, 'Failed to create the subwindow. Cause: windowStage_ is null');
    } else {
      this.windowStage_.createSubWindow("giraffe", (err: BusinessError, data) => {
        let errCode: number = err.code;
        if (errCode) {
          MLog.error(TAG, 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          return;
        }
        this.sub_windowClass = data;
        MLog.info(TAG, 'Succeeded in creating the subwindow. Data: ' + `x: ${this.locationX}`);

        // 2.子窗口创建成功后，设置子窗口的位置、大小及相关属性等。
        this.sub_windowClass.moveWindowTo(Math.floor(this.locationX), Math.floor(this.locationY), (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            MLog.error(TAG, 'Failed to move the window. Cause:' + JSON.stringify(err));
            return;
          }
        }
        )
        ;
        this.sub_windowClass.resize(this.size, this.size, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            MLog.error(TAG, 'Failed to change the window size. Cause:' + JSON.stringify(err));
            return;
          }
        });
        this.sub_windowClass.setUIContent("../components/mainpage/MainDebugPage", (err: BusinessError) => {
        // this.sub_windowClass.loadContentByName("MainDebugPage23", (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            MLog.error(TAG, 'Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          // 3.显示子窗口。
          (this.sub_windowClass as window.Window).showWindow((err: BusinessError) => {
            let errCode: number = err.code;
            if (errCode) {
              MLog.error(TAG, 'Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            data.setWindowBackgroundColor("#ff3333")
          });
        });
      }
      )
    }
  }

  destroy() {
    if (this.sub_windowClass) {
      this.sub_windowClass.destroyWindow((err: BusinessError) => {
        let errCode: number = err.code;
        if (errCode) {
          MLog.error(TAG, 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
          return;
        }
      })
    }
  }
}

export default new GiraffeFloatManager()