//
//  Store.swift
//  Learning-Flux
//
//  Created by Nanu Jogi on 26/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Fluxus

let rootStore = RootStore()

final class RootStore: ObservableObject {
    
    var willChange = PassthroughSubject<RootStore, Never>()
    
    @Published var state = RootState() {
        didSet {
            objectWillChange.send()
            // willChange.send(self)
        }
    }
    
    func commit(_ mutation: Mutation) {
        switch mutation {
        case is CounterMutation:
            state.counter = CounterCommitter().commit(state: self.state.counter, mutation: mutation as! CounterMutation)
        default:
            print("Unknown mutation type")
        }
    }
    
   func dispatch(_ action: Action) {
       switch action {
       case is CounterAction:
         CounterDispatcher(commit: self.commit).dispatch(action: action as! CounterAction)
       default:
         print("Unknown action type!")
       }
     }
}
