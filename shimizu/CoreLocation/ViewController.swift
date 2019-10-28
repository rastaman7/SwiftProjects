import UIKit
import CoreLocation
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // javascriptを呼び出しを可能にするWKUserContentControllerクラスの生成
        let userController = WKUserContentController()
        userController.add(self, name: "callbackHandler")
        // WKWebViewの設定を行う為のWKWebViewConfigurationクラスの生成
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = userController

        // WKWebView生成
        webView = WKWebView(frame: CGRect(x: 0,
                                          y: 0,
                                      width: self.view.frame.size.width,
                                     height: self.view.frame.size.height),
                    configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        // 表示するアドレス設定
        let request = URLRequest(url: URL(string: "http://localhost:8080/test.html")!)
        self.webView.load(request)
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    
        if(message.name == "callbackHandler") {
            print(message.body)
        }
    }
}
