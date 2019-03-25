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
    var buttonArray: [UIButton] = []
    var moguraState: [Int] = [0,0,0,0,0,0]

    @IBAction func BackPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true
            , completion: nil)
    }
    
    func randomUp(mogura:UIButton){
        if moguraState[mogura.tag] == 0 {
            moguraState[mogura.tag] = 1
        }else{
            print("error")
        }
        let rand_num = Double.random(in: 1.0..<6.0)
        mytimer[mogura.tag].startTimer2(defaultTime: rand_num)
        print("Next Up: \(rand_num)")
        DispatchQueue.main.asyncAfter(deadline: .now() + rand_num){
            mogura.setImage(self.mogura1Image, for: .normal)
        }
    }
    
    func choose(){
        while 1==1 {
            let rand_mogura = buttonArray[Int(arc4random()) % buttonArray.count]
            if moguraState[rand_mogura.tag] == 0{
                randomUp(mogura: rand_mogura)
                break
            }
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
    @IBOutlet weak var mogura2: UIButton!
    @IBOutlet weak var mogura3: UIButton!
    @IBOutlet weak var mogura4: UIButton!
    @IBOutlet weak var mogura5: UIButton!
    @IBAction func moguraPressed(_ sender: UIButton) {
        if sender.currentImage!.isEqual(mogura1Image){
            mytimer[sender.tag].stopTimer()
            moguraState[sender.tag] = 0
            print("hit!")
            print(mytimer[sender.tag].returnTimeDouble())
            total = total + mytimer[sender.tag].returnTimeDouble()
            print("total: \(total)")
            sender.setImage(mogura0Image, for: .normal)
            choose()
            count += 1
            if count == 10{
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
        mogura2.tag = 2
        mogura3.tag = 3
        mogura4.tag = 4
        mogura5.tag = 5
        buttonArray = [mogura0, mogura1, mogura2, mogura3, mogura4, mogura5]
        print("start game")
        for _ in 0..<6 {
            mytimer.append(MyTimer())
        }
        for _ in 0..<3 {
            choose()
        }
    }
    deinit {
        print("second being deinitialized")
    }
}
