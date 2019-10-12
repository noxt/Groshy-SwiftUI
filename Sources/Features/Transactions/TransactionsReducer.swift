//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension TransactionsFeature {
    static func reduce(state: State, action: Action) -> State {
        var state = state

        switch action {
        case let action as Actions.SetFilter:
            state.filter = action.filter

        case let action as Actions.SetAllTransactions:
            state.transactions = action.transactions.normalized

        case let action as Actions.SaveTransaction:
            state.transactions[action.transaction.id] = action.transaction

        case let action as Actions.SetFilter:
            state.filter = action.filter

        default:
            break
        }

        return state
    }
}
