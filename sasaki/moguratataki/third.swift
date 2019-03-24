//
//  third.swift
//  moguraMaster
//
//  Created by Joey Shimizu on 2019/03/24.
//  Copyright © 2019 Joey Shimizu. All rights reserved.
//

import UIKit

class third: UIViewController {
    
    var score = 0.0

    @IBAction func BackPressed(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        let myScoreClassifier = scoreClassifier(score: self.score)
        rankLabel.text = myScoreClassifier.classify()
    }
    deinit {
        print("third being deinitialized")
    }
}
