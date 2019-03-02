import UIKit

class ViewController: UIViewController {
    // Timerクラスのインスタンス
    var timer = Timer()
    // Startボタンを押した時刻
    var startTime:Double = 0.0
    
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var button: UIButton!
        
    @IBAction func buttonStart() {
        // 開始した時刻を記録
        startTime = Date().timeIntervalSince1970
        // ラベルを更新(残り5秒にする)
        labelTimer.text = "00:05"
        // 0.01秒ごとにupdateLabel()を呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        // タイマーが完了するまでボタンを非活性にする
        button.isEnabled = false
    }
    
    func updateLabel() {
        // 経過した時間を、現在の時刻-開始時刻で算出(秒)
        let elapsedTime = Date().timeIntervalSince1970 - startTime
        // 小数点以下を切り捨てる
        let flooredElapsedTime = Int(floor(elapsedTime))
        // 残り時間
        let leftTime = 5 - flooredElapsedTime
        // ラベルに表示する残り時間
        let displayString = NSString(format: "00:%02d", leftTime) as String
        // ラベルを更新
        labelTimer.text = displayString
        
        // 残り0秒になった時の処理
        if leftTime == 0 {
            // タイマーを止める
            timer.invalidate()
            // アラートを表示する
            let alert = UIAlertController(title: "完了", message: "5秒経ちました。", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            // ボタンを押下できるようにする
            button.isEnabled = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

