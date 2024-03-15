import { Constant } from '../../../utils/Constant'
import { HuShenBlockPage } from './HuShenBlockPage'

/**
 * 行情-市场
 */
@Component
export struct MarketPage {
  @State nowSelectedIndex: number = 0
  tabArray: string[] = ['A股', '板块', '创业板', '科创板', '京市', '新三板', '港股', '更多']

  build() {
    Tabs({
      index: this.nowSelectedIndex,
      barPosition: BarPosition.Start
    }) {
      ForEach(this.tabArray, (item: string, index: number) => {
        TabContent() {
          if (index == 0) {
            HuShenBlockPage()
          } else {
            Text(item)
              .fontSize('56fp')
              .fontColor($r('app.color.default_black'))
              .textAlign(TextAlign.Center)
              .width(Constant.FULL_PERCENT)
              .height(Constant.FULL_PERCENT)
          }
        }
        .tabBar(this.MarketPageTab(item, index))
      })
    }
    .barMode(BarMode.Scrollable)
    .barHeight('40vp')
    .barWidth(Constant.FULL_PERCENT)
    .scrollable(true)
    .width(Constant.FULL_PERCENT)
    .height(Constant.FULL_PERCENT)
    .onChange((index: number) => {
      this.nowSelectedIndex = index;
    })
  }

  @Builder MarketPageTab(title: string, index: number) {
    Text(title)
      .fontSize('18fp')
      .fontColor(index == this.nowSelectedIndex ? $r('app.color.default_black') : $r('app.color.default_black_trans50'))
      .margin({left: '12vp'})
  }
}
