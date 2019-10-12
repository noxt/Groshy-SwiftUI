//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension TransactionsFeature {
    struct State: FluxState, Codable {
        var transactions: [Transaction.ID: Transaction]
        var filter: TransactionFilter

        static let initial = State(
            transactions: [:],
            filter: .perDay
        )
    }
}


extension TransactionsFeature.State {

    var filteredTransactions: [Transaction] {
        let granularity: Calendar.Component
        switch filter {
        case .perDay:
            granularity = .day
        case .perWeek:
            granularity = .weekOfYear
        case .perMonth:
            granularity = .month
        case .perYear:
            granularity = .year
        case .allTime:
            granularity = .era
        }

        return transactions.values
            .filter({ (transaction) -> Bool in
                return Calendar.current.isDate(Date(), equalTo: transaction.date, toGranularity: granularity)
            })
    }

    func transactionsForCategory(_ categoryID: Category.ID) -> [Transaction] {
        return filteredTransactions
            .filter { $0.categoryID == categoryID }
    }

}
