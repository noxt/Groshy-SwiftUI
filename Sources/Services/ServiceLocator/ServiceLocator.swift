//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


let serviceLocator = ServiceLocator(
    keychainService: KeychainAccessService(),
    categoriesService: CategoriesService(),
    transactionsService: TransactionsService(),
    syncService: SyncService()
)


final class ServiceLocator : ServiceLocatorProtocol {

    private(set) var keychainService: KeychainServiceProtocol
    private(set) var categoriesService: CategoriesServiceProtocol
    private(set) var transactionsService: TransactionsServiceProtocol
    private(set) var syncService: SyncServiceProtocol


    init(
        keychainService: KeychainServiceProtocol,
        categoriesService: CategoriesServiceProtocol,
        transactionsService: TransactionsServiceProtocol,
        syncService: SyncServiceProtocol
    ) {
        self.keychainService = keychainService
        self.categoriesService = categoriesService
        self.transactionsService = transactionsService
        self.syncService = syncService
    }

}
