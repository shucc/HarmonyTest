import { Constant } from '../../../utils/Constant'
import { IndexListLayout } from '../../../widget/IndexListLayout'
@Component
export struct HuShenBlockPage {
  build() {
    Column() {
      IndexListLayout()
    }
    .height(Constant.FULL_HEIGHT_PERCENT)
    .width(Constant.FULL_WIDTH_PERCENT)
  }
}