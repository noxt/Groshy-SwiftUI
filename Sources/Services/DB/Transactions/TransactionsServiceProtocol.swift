//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol TransactionsServiceProtocol {

    func load(completed: @escaping ((Result<[Transaction], Error>) -> Void))
    func save(_ model: Transaction, completed: @escaping ((Result<Transaction, Error>) -> Void))
    func delete(_ id: Transaction.ID, completed: @escaping ((Result<Void, Error>) -> Void))

}
