import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Hello: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    let file_name = "data.txt"
    let text = "12345" //保存する内容
    
    
    @IBAction func button1Pressed() {
        Hello.text = "Pressed"
        
        if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first {
            
            let path_file_name = dir.appendingPathComponent( file_name )
            
            do {
                
                try text.write( to: path_file_name, atomically: false, encoding: String.Encoding.utf8 )
                
            } catch {
                //エラー処理
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}
