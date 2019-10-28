import UIKit
import CoreLocation
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //if let url = NSURL(string: "https://7kake.com") {
        if let url = NSURL(string: "http://localhost:8080/test.html") {
            let request = NSURLRequest(url: url as URL)
            webView.load(request as URLRequest)
        }
    }
}
