import { MLog } from '@comm/commonlib/src/main/ets/utils/log/MLog';
import FloatManager from '../../float/GiraffeFloatManager';

// @Entry({routeName: "MainDebugPage"})
@Component
export struct MainDebugPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Image($r('app.media.mobile_dev'))
        .width('100%')
        .height('100%')
    }
    .gesture(
      GestureGroup(GestureMode.Exclusive,
        PanGesture()
          .onActionUpdate((event: GestureEvent | undefined) => {
            if (event) {
              MLog.error(`offsetX: ${event.offsetX} offsetY: ${event.offsetY}`)
              FloatManager.updateLocation(event.offsetX, event.offsetY)
            }
          })
          .onActionEnd(() => {
            MLog.info(`PanGesture onActionEnd`)
            FloatManager.updateLocationByEnd()
          }),
        TapGesture({ count: 1 })
          .onAction(() => {
            // this.context.eventHub.emit(FloatEventHubConstants.event_click_float)
          }))
    )
  }
}
