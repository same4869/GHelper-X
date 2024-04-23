import { CommonConstants } from '../constants/CommonConstants';
import { MLog } from '../utils/log/MLog';
import { HomeViewModel } from './HomeViewModel';

@Component
export struct HomePage {
  @State homeViewModel: HomeViewModel = new HomeViewModel()

  aboutToAppear(): void {
    MLog.debug('HomePage aboutToAppear')
  }

  build() {
    Navigation() {
      Column() {
        List({space: CommonConstants.SPACE_16}) {
          ListItem(){

          }

        }
        .height("100%")
        .width("100%")
        .scrollBar(BarState.Off)
        .layoutWeight(1)
      }.height("100%").width("100%").backgroundColor("#00ffff")
    }
    .mode(NavigationMode.Auto)
  }
}