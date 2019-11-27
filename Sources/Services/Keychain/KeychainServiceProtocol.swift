//
//  Created by Dmitry Ivanenko on 16.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol KeychainServiceProtocol {
    func setValue<T: Encodable>(_ value: T, forKey key: String, complete: (Result<T, KeychainServiceError>) -> Void)
    func getValue<T: Decodable>(forKey key: String, complete: (Result<T, KeychainServiceError>) -> Void)
    func deleteValue(forKey key: String, complete: (Result<Void, KeychainServiceError>) -> Void)
}
