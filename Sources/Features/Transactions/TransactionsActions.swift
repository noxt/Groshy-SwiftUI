//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension TransactionsFeature {
    enum Actions {

        struct SetAllTransactions: Action {
            let transactions: [Transaction]
        }

        struct SetFilter: AsyncAction {
            let filter: TransactionFilter

            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                guard let state = state as? AppFeature.State else {
                    return
                }
//                state.
            }
        }

        struct LoadTransactions: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                dispatch(Actions.SetAllTransactions(transactions: [

                ]))
            }
        }

        struct SaveTransaction: Action {
            let transaction: Transaction
        }


    }
}
