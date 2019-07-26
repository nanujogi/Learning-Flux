//
//  Mutations.swift
//  Learning-Flux
//
//  Created by Nanu Jogi on 26/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import Foundation
import Fluxus

enum CounterMutation: Mutation {
    case Increment
    case AddAmount(Int)
    case SetMyBool(Bool)
}
