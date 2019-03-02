import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonClicked(){
        
        let alertController = UIAlertController(
            title:"Hello!",
            message:"Clicked!",
            preferredStyle:UIAlertControllerStyle.alert)
        
        alertController.addAction(
            UIAlertAction(
                title:"OK",
                style:UIAlertActionStyle.default,
                handler:nil))
        
        present(
            alertController,
            animated:true,
            completion:nil)
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
