//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


final class ServiceLocator: ServiceLocatorProtocol {

    var keychainService: KeychainServiceProtocol


    init(keychainService: KeychainServiceProtocol) {
        self.keychainService = keychainService
    }

}
