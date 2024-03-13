import bridge from '@arkui-x.bridge';

const bridgeImpl = bridge.createBridge("Bridge")

@Component
export struct HomePage {
  build() {
    Stack() {
      Text("今天的天气真呀真真好").fontSize(16)
      Button("向安卓发送").onClick(event => {
        bridgeImpl.sendMessage("msg to Android").then((res) => {
          console.log("response: " + res)
        }).catch((err: string) => {
          console.log("error: " + JSON.stringify(err))
        })
      })

    }.height("100%").width("100%").backgroundColor("#00ffff")
  }
}