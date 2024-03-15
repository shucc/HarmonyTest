import { TabItem } from '../model/TabItem'
import { Constant } from '../utils/Constant'
import { FinancialPage } from './financial/FinancialPage'
import { HomePage } from './home/HomePage'
import { MyPage } from './my/MyPage'
import { QuotesPage } from './quotes/QuotesPage'
import { TradePage } from './trade/TradePage'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 1

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBottom({
          index: 0,
          title: '首页',
          imageActivated: $r('app.media.tztzz_toolbar_on_50501'),
          imageOriginal: $r('app.media.tztzz_toolbar_50501')
        }, 0))

        TabContent() {
          QuotesPage()
        }
        .tabBar(this.TabBottom({
          index: 1,
          title: '行情',
          imageActivated: $r('app.media.tztzz_toolbar_on_1516'),
          imageOriginal: $r('app.media.tztzz_toolbar_1516')
        }, 1))

        TabContent() {
          TradePage()
        }
        .tabBar(this.TabBottom({
          index: 2,
          title: '交易',
          imageActivated: $r('app.media.tztzz_toolbar_on_1287'),
          imageOriginal: $r('app.media.tztzz_toolbar_1287')
        }, 2))

        TabContent() {
          FinancialPage()
        }
        .tabBar(this.TabBottom({
          index: 3,
          title: '理财',
          imageActivated: $r('app.media.tztzz_toolbar_on_1035'),
          imageOriginal: $r('app.media.tztzz_toolbar_1035')
        }, 3))

        TabContent() {
          MyPage()
        }
        .tabBar(this.TabBottom({
          index: 4,
          title: '我的',
          imageActivated: $r('app.media.tztzz_toolbar_on_50521'),
          imageOriginal: $r('app.media.tztzz_toolbar_50521')
        }, 4))
      }
      .barMode(BarMode.Fixed)
      .barWidth(Constant.FULL_PERCENT)
      .scrollable(false)
      .barHeight('48vp')
      .onChange((index: number) => {
        this.selectedIndex = index;
      })

      Line()
        .width(Constant.FULL_PERCENT)
        .height('0.5vp')
        .backgroundColor($r('app.color.default_guide_line'))
        .margin({ bottom: '47vp' })
    }
    .width(Constant.FULL_PERCENT)
    .height(Constant.FULL_PERCENT)
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(index == this.selectedIndex ? item.imageActivated : item.imageOriginal)
        .width('20vp')
        .height('20vp')
      Text(item.title)
        .width(Constant.FULL_PERCENT)
        .fontSize('12vp')
        .fontColor(index == this.selectedIndex ? $r('app.color.default_db_gold') : $r('app.color.default_black_trans50'))
        .textAlign(TextAlign.Center)
    }
    .justifyContent(FlexAlign.Center)
    .width(Constant.FULL_PERCENT)
    .height(Constant.FULL_PERCENT)
  }
}