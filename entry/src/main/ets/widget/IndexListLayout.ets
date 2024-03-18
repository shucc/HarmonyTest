import { IndexListItemBean } from '../model/IndexListItemBean'
import { Constant } from '../utils/Constant'
import { applyAlphaToColor, getColorByRange } from '../utils/ColorUtil'
import { getPrice } from '../utils/StringUtil'
import router from '@ohos.router';

@Component
export struct IndexListLayout {
  indexListData = [
    new IndexListItemBean('上证指数', '3015.17', '-1.94%'),
    new IndexListItemBean('深证成指', '9300.44', '+3.13%'),
    new IndexListItemBean('北证50', '920.46', '3.41%'),
    new IndexListItemBean('创业板指', '1807.03', '0.04%'),
    new IndexListItemBean('科创50', '807.17', '+0.00%'),
  ]

  build() {
    Column() {
      List({ space: '8vp', initialIndex: 0 }) {
        ForEach(this.indexListData, (itemBean: IndexListItemBean) => {
          ListItem() {
            Column() {
              Text(itemBean.stockPrice)
                .fontSize('20fp')
                .fontColor(getColorByRange(itemBean.stockPriceRange))
                .height('50%')
                .width(Constant.FULL_PERCENT)
                .align(Alignment.Start | Alignment.Bottom)

              Row() {
                Text(itemBean.stockName)
                  .fontSize('16fp')
                  .fontColor($r('app.color.default_black'))
                  .align(Alignment.Start)

                Text(getPrice(itemBean.stockPriceRange))
                  .fontSize('16fp')
                  .fontColor(getColorByRange(itemBean.stockPriceRange))
                  .margin({ left: '12vp' })
              }
              .width(Constant.FULL_PERCENT)
              .height('50%')
            }
            .padding({ left: '8vp', right: '8vp' })
            .width('40%')
            .height(Constant.FULL_PERCENT)
            .borderRadius('4vp')
            .backgroundColor(applyAlphaToColor(getColorByRange(itemBean.stockPriceRange), 0.1))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/StockDetailPage',
                params: { stockDetail: itemBean }
              })
            })
          }
          .height(Constant.FULL_PERCENT)
        })
      }
      .width(Constant.FULL_PERCENT)
      .height('70vp')
      .listDirection(Axis.Horizontal)
      .margin({ top: '4vp' })
    }
    .width(Constant.FULL_PERCENT)
    .height('78vp')
  }
}