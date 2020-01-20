//
//  Created by Dmitry Ivanenko on 16.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol ServiceLocatorProtocol {
    var keychainService: KeychainServiceProtocol { get }
    var categoriesService: CategoriesServiceProtocol { get }
    var transactionsService: TransactionsServiceProtocol { get }
    var syncService: SyncServiceProtocol { get }
}
