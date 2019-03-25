//
//  scoreClassifier.swift
//  moguraMaster
//
//  Created by Joey Shimizu on 2019/03/24.
//  Copyright © 2019 Joey Shimizu. All rights reserved.
//

import Foundation
class scoreClassifier{
    var score: Double
    init(score: Double) {
        self.score = score
    }
    
    func classify() -> String {
        if score > 97.0 {
            return "神"
        }else if score > 95.0 {
            return "超人"
        }else if score > 92.0 {
            return "ハヤブサ"
        }else if score > 90.0 {
            return "チーター"
        }else if score > 87.0 {
            return "ホース"
        }else if score > 85.0 {
            return "うさぎ"
        }else if score > 75.0 {
            return "人"
        }else if score > 70.0 {
            return "ペンギン"
        }else{
            return "カタツムリ"
        }
    }
}
