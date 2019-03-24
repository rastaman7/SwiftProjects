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
    var mytimer: [MyTimer] = []

    @IBAction func BackPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true
            , completion: nil)
    }
    
    func randomUp(mogura:UIButton){
        let rand_num = Double.random(in: 1.0..<5.0)
        mytimer[0].startTimer2(defaultTime: rand_num)
        print(rand_num)
        DispatchQueue.main.asyncAfter(deadline: .now() + rand_num){
            mogura.setImage(self.mogura1Image, for: .normal)
        }
    }
    
    @IBOutlet weak var mogura: UIButton!
    @IBAction func moguraPressed() {
        if mogura.currentImage!.isEqual(mogura1Image){
            mytimer[0].stopTimer()
            print("hit!")
            print(mytimer[0].returnTimeDouble())
            mogura.setImage(mogura0Image, for: .normal)
            randomUp(mogura: mogura)
        }else{
            print("wrong timing")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<1 {
            mytimer.append(MyTimer())
        }
        randomUp(mogura: mogura)
    }
    deinit {
        print("second being deinitialized")
    }
}
