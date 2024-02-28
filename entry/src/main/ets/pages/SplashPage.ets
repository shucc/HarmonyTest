import router from '@ohos.router'

@Entry
@Component
struct SplashPage {
  @State skipNumber: number = 3
  private intervalID: number

  aboutToAppear() {
    this.startCount()
  }

  /**
   * 倒计时跳转
   */
  startCount() {
    this.intervalID = setInterval(function(){
      if (this.skipNumber <= 0) {
        clearInterval(this.intervalID)
        router.replaceUrl({ url: 'pages/Index' })
      } else {
        this.skipNumber--
      }
    }.bind(this), 1000)
  }

  build() {
    Row() {
      RelativeContainer() {
        Image($r('app.media.ic_splash'))
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          })
          .width('100%')
          .height('100%')
          .id('iv_splash')
        Row() {
          Text('跳过')
            .fontColor(Color.White)
            .fontSize('13fp')
          Text(this.skipNumber + '秒')
            .fontColor('#c59031')
            .fontSize('13fp')
        }
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .borderRadius('4vp')
        .backgroundColor('#4C000000')
        .margin({ top: '20vp', right: '20dp' })
        .padding({ left: '8vp', right: '8vp', top: '5vp', bottom: '5vp' })
        .onClick(() => {
          clearInterval(this.intervalID)
          router.replaceUrl({ url: 'pages/Index' })
        })
        .id('row_skip')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}