/**
 * @Author: xwang
 * @Date: 2024/4/18 09:52
 * @Description:
 **/
import { BannerInfoData } from '../model/BannerInfoData'

@Component
struct Banner {
  @Prop swiperData: BannerInfoData[]
  private swiperController: SwiperController = new SwiperController()

  build() {
    Swiper(this.swiperController) {

    }
  }
}
