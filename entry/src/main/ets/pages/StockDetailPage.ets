import router from '@ohos.router';
import { IndexListItemBean } from '../model/IndexListItemBean';

@Entry
@Component
struct StockDetailPage {
  private stockDetail: IndexListItemBean = router.getParams()['stockDetail']

  build() {
    Row() {
      Column() {
        Text(this.stockDetail.stockName)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}