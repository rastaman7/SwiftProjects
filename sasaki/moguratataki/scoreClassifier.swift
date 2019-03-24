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
        if score < 1.0 {
            return "神"
        }else if score < 2.0 {
            return "超人"
        }else if score < 3.0 {
            return "普通"
        }else{
            return "カタツムリ"
        }
    }
}
