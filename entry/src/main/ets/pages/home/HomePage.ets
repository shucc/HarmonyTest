import webview from '@ohos.web.webview';
import { Constant } from '../../utils/Constant';

@Component
export struct HomePage {
  webViewController: webview.WebviewController = new webview.WebviewController

  build() {
    Web({ src: 'https://www.baidu.com', controller: this.webViewController })
      .width(Constant.FULL_PERCENT)
      .height(Constant.FULL_PERCENT)
  }
}