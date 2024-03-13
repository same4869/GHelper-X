import { TabItem } from '../../model/TabItem'

export class MainViewModel {
  /**
   * 首页底部Tab显示数据
   */
  tabTitle: TabItem[] = [
    {
      index: 0,
      title: "首页",
      imageActivated: $r('app.media.menu_home_sel'),
      imageOriginal: $r('app.media.menu_home_nor')
    },
    {
      index: 1,
      title: "走路",
      imageActivated: $r('app.media.menu_walk_sel'),
      imageOriginal: $r('app.media.menu_walk_nor')
    },
    {
      index: 2,
      title: "赚币",
      imageActivated: $r('app.media.menu_money_sel'),
      imageOriginal: $r('app.media.menu_money_nor')
    },
    {
      index: 3,
      title: "我的",
      imageActivated: $r('app.media.menu_mine_sel'),
      imageOriginal: $r('app.media.menu_mine_nor')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;