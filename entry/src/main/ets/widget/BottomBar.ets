@Component
export struct BottomBar {

  private bottomBarStr: string =  "首页,50501|行情,1516|交易,1287|理财,1035|我的,50521"

  build() {
    Row() {
      ForEach(this.bottomBarStr.split('|'), (item: string) => {
        Text(item.split(',')[0])
          .fontSize('13fp')
          .width('20%')
      })
    }
    .width('100%')
    .height('48vp')
  }
}