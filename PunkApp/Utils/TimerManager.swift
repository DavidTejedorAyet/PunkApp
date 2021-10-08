//
//  TimerManager.swift
//  PunkApp
//
//  Created by David on 8/10/21.
//

import Foundation

class TimerManager {
    
    var timer = Timer()
    
    func waitForTimer(seconds: TimeInterval, completion: @escaping () -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { timer in
            completion()
        }
    }
    
}
