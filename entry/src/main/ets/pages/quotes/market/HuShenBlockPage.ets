import { Constant } from '../../../utils/Constant'
import { IndexListLayout } from '../../../widget/IndexListLayout'
@Component
export struct HuShenBlockPage {
  build() {
    Column() {
      IndexListLayout()
    }
    .height(Constant.FULL_PERCENT)
    .width(Constant.FULL_PERCENT)
  }
}