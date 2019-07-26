//
//  State.swift
//  Learning-Flux
//  Created by Nanu Jogi on 26/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.

import Foundation
import Fluxus

struct CounterState: FluxState {
    var count = 0
    var myBoolValue = false
    
    var countIsEven: Bool {
        get {
            return count % 2 == 0
        }
    }
    
    func countIsDivisibleBy(_ by: Int) -> Bool {
        return count % by == 0
    }
}

struct RootState {
    var counter = CounterState()
}
