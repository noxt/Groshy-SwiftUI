//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension TransactionsFeature {
    enum Actions {

        struct LoadTransactions: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
//                serviceLocator.transactionsService.load { (result) in
//                    switch result {
//                    case .success(let transactions):
//                        dispatch(Actions.SetAllTransactions(transactions: transactions))
//                    case .failure(let error):
//                        print("[Error][LoadTransactions] \(error)")
//                    }
//                }
            }
        }

        struct SaveTransaction: AsyncAction {
            let transaction: Transaction

            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
//                serviceLocator.transactionsService.save(transaction) { (result) in
//                    switch result {
//                    case let .success(transaction):
//                        print("[Success][SaveTransaction]")
//                    case let .failure(error):
//                        print("[Error][SaveTransaction] \(error)")
//                    }
//                }
            }
        }

        struct SetAllTransactions: Action {
            let transactions: [Transaction]
        }

        struct SetFilter: Action {
            let filter: TransactionFilter
        }

    }
}
