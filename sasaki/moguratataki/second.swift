//
//  second.swift
//  moguraMaster
//
//  Created by Joey Shimizu on 2019/03/22.
//  Copyright © 2019 Joey Shimizu. All rights reserved.
//

import UIKit

class second: UIViewController {
    
    let mogura0Image:UIImage = UIImage(named: "mogura0")!
    let mogura1Image:UIImage = UIImage(named: "mogura1")!

    @IBAction func BackPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true
            , completion: nil)
    }
    
    func randomUp(mogura:UIButton){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            mogura.setImage(self.mogura1Image, for: .normal)
        }
    }
    
    @IBOutlet weak var mogura: UIButton!
    @IBAction func moguraPressed() {
        if mogura.currentImage!.isEqual(mogura1Image){
            print("hit!")
            mogura.setImage(mogura0Image, for: .normal)
            randomUp(mogura: mogura)
        }else{
            print("wrong timing")
            //mogura.setImage(mogura1Image, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomUp(mogura: mogura)
        // Do any additional setup after loading the view.
    }
    deinit {
        print("second being deinitialized")
    }
}
