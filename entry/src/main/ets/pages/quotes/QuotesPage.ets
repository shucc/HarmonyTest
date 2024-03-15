import { Constant } from '../../utils/Constant'
import { MarketPage } from './market/MarketPage'
import { OptionalPage } from './optional/OptionalPage'
import { QuotesOtherPage } from './other/QuotesOtherPage'

/**
 * 行情
 */
@Component
export struct QuotesPage {
  @State nowSelectedIndex: number = 1

  build() {
    Column() {
      Row() {
        this.QuotesTopBar('自选', 0)
        this.QuotesTopBar('市场', 1)
        this.QuotesTopBar('主力豹击', 2)
      }
      .height('40vp')
      .width(Constant.FULL_PERCENT)

      Tabs({
        index: this.nowSelectedIndex,
        barPosition: BarPosition.Start
      }) {
        TabContent() {
          OptionalPage()
        }

        TabContent() {
          MarketPage()
        }

        TabContent() {
          QuotesOtherPage()
        }
      }
      .barMode(BarMode.Scrollable)
      .barHeight('0vp')
      .barWidth(Constant.FULL_PERCENT)
      .scrollable(false)
      .onChange((index: number) => {
        this.nowSelectedIndex = index;
      })
    }.width(Constant.FULL_PERCENT)
  }

  @Builder QuotesTopBar(title: string, index: number) {
    Text(title)
      .fontSize(index == this.nowSelectedIndex ? '22fp' : '18fp')
      //.animation({ duration: 1000, curve: Curve.Ease })
      .margin({ left: '12vp' })
      .backgroundColor(Color.White)
      .height(Constant.FULL_PERCENT)
      .fontColor(index == this.nowSelectedIndex ? $r('app.color.default_black') : $r('app.color.default_black_trans50'))
      .onClick(() => {
        this.nowSelectedIndex = index
      })
  }
}