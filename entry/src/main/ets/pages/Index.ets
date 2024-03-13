import { CommonConstants } from '../constants/CommonConstants'
import { HomePage } from '../home/HomePage'
import { TabItem } from '../model/TabItem'
import { MoneyPage } from '../money/MoneyPage'
import { WalkPage } from '../walk/WalkPage'
import mainViewModel from '../main/vm/MainViewModel'
import { MinePage } from '../mine/MinePage'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TabBottom(mainViewModel.tabTitle[0], 0))

        TabContent() {
          WalkPage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[1], 1))

        TabContent() {
          MoneyPage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[2], 2))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[3], 3))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight($r('app.float.size_56'))
      .onChange((index: number) => {
        this.selectedIndex = index;
      })
    }
  }

  @Builder
  TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex == index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.size_21'))
        .width($r('app.float.size_21'))
        .margin({
          top: $r('app.float.size_8'),
          bottom: $r('app.float.size_5')
        })
      Text(item.title)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height($r('app.float.size_14'))
        .fontSize($r('app.float.size_text_10'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? $r('app.color.color_red') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.size_7')
        })
    }.justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor($r("app.color.color_white"))
  }
}