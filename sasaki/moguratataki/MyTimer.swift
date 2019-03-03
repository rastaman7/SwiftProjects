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
    
    func returnTimeDouble()-> Double{
        return elapsedTime
    }
    
    func returnTimeString()-> String{
        let elapsedTimeStr: String = String(elapsedTime)
        return elapsedTimeStr
    }
}
