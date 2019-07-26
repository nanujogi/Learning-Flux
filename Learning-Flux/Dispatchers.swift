//
//  Dispatchers.swift
//  Learning-Flux
//
//  Created by Nanu Jogi on 26/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import Foundation
import Fluxus

struct CounterDispatcher: Dispatcher {
    var commit: (Mutation) -> Void
    
    func dispatch(action: CounterAction) {
        switch action {
        case .IncrementRandom:
            IncrementRandom()
        case .IncrementRandomWithRange(let range):
            IncrementRandom(range: range)
        }
    }
    
    func IncrementRandom(range: Int = 100) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
            let exampleResultFromAsynOperation = Int.random(in: 1..<range)
            self.commit(CounterMutation
            .AddAmount(exampleResultFromAsynOperation)
            )
        })
    }
}
