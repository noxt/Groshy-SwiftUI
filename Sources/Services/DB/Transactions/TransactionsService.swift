//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import Foundation


final class TransactionsService : TransactionsServiceProtocol {
    private lazy var transactions = DBTable<Transaction>(collection: "transactions")
}


// MARK: - TransactionsServiceProtocol

extension TransactionsService {

    func load(completed: @escaping ((Result<[Transaction], Error>) -> Void)) {
        transactions.loadAll(completed: completed)
    }

    func save(_ model: Transaction, completed: @escaping ((Result<Transaction, Error>) -> Void)) {
        transactions.save(model, by: model.id.uuidString, completed: completed)
    }

    func delete(_ id: Transaction.ID, completed: @escaping ((Result<Void, Error>) -> Void)) {
        transactions.delete(id.uuidString, completed: completed)
    }

}
