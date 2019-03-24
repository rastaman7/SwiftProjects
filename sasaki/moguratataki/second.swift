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
    var count = 0
    var total = 0.0

    @IBAction func BackPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true
            , completion: nil)
    }
    
    func randomUp(mogura:UIButton){
        let rand_num = Double.random(in: 1.0..<5.0)
        mytimer[mogura.tag].startTimer2(defaultTime: rand_num)
        print("Next Up: \(rand_num)")
        DispatchQueue.main.asyncAfter(deadline: .now() + rand_num){
            mogura.setImage(self.mogura1Image, for: .normal)
        }
    }
    
    func toThird(){
        let storyboard: UIStoryboard = self.storyboard!
        let third = storyboard.instantiateViewController(withIdentifier: "third") as! third
        third.total = total
        self.present(third, animated: true, completion: nil)
    }
    
    @IBOutlet weak var mogura0: UIButton!
    @IBOutlet weak var mogura1: UIButton!
    @IBAction func moguraPressed(_ sender: UIButton) {
        if sender.currentImage!.isEqual(mogura1Image){
            mytimer[sender.tag].stopTimer()
            print("hit!")
            print(mytimer[sender.tag].returnTimeDouble())
            total = total + mytimer[sender.tag].returnTimeDouble()
            print("total: \(total)")
            sender.setImage(mogura0Image, for: .normal)
            randomUp(mogura: sender)
            count += 1
            if count == 5{
                toThird()
            }
        }else{
            print("wrong timing")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mogura0.tag = 0
        mogura1.tag = 1
        print("start game")
        for _ in 0..<2 {
            mytimer.append(MyTimer())
        }
        randomUp(mogura: mogura0)
        randomUp(mogura: mogura1)
    }
    deinit {
        print("second being deinitialized")
    }
}
