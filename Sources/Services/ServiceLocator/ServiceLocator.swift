//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


let serviceLocator = ServiceLocator(
    keychainService: KeychainAccessService(),
    categoriesService: CategoriesService()
)


final class ServiceLocator : ServiceLocatorProtocol {

    private(set) var keychainService: KeychainServiceProtocol
    private(set) var categoriesService: CategoriesServiceProtocol


    init(
        keychainService: KeychainServiceProtocol,
        categoriesService: CategoriesServiceProtocol
    ) {
        self.keychainService = keychainService
        self.categoriesService = categoriesService
    }

}
