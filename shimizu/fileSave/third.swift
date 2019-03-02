import UIKit

class third: UIViewController {
    
    let file_name = "data.txt"
    let text = "6789" //保存する内容

    @IBOutlet weak var button3: UIButton!
    @IBAction func button3Pressed() {
        
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
