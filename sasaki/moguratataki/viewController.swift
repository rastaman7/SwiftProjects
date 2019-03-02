import UIKit

class ViewController: UIViewController {
    
    let mogura0Image:UIImage = UIImage(named: "mogura0")!
    let mogura1Image:UIImage = UIImage(named: "mogura1")!

    @IBOutlet weak var button0: UIButton!
    @IBAction func button0Pressed() {
        print("button pressed")
        button0.setImage(mogura1Image, for: .normal)
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

