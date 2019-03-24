//
//  MyTimer.swift
//  moguraMaster
//
//  Created by Joey Shimizu on 2019/03/22.
//  Copyright © 2019 Joey Shimizu. All rights reserved.
//

import Foundation
class MyTimer{
    var timer = Timer()
    var startTime:Double = 0.0
    var elapsedTime: Double = 0.0
    
    func startTimer(){
        startTime = Date().timeIntervalSince1970
    }
    
    func stopTimer(){
        elapsedTime = Date().timeIntervalSince1970 - startTime
        print(elapsedTime)
    }
    
    func startTimer2(defaultTime:Double){
        startTime = Date().timeIntervalSince1970 + defaultTime
    }
    
    func returnTimeDouble()-> Double{
        return elapsedTime
    }
    
    func returnTimeString()-> String{
        let elapsedTimeStr: String = String(elapsedTime)
        return elapsedTimeStr
    }
}
