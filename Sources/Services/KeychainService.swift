//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import KeychainAccess


enum KeychainKey: String, CaseIterable {
    case categories
    case transactions
    case hashtags
}


enum KeychainServiceError: Error {

    case encodingError
    case decodingError

    case savingError
    case gettingError
    case deletingError

}


final class KeychainStorageService {

    private let keychain: Keychain
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!), encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) {
        self.keychain = keychain
        self.encoder = encoder
        self.decoder = decoder
    }

}


extension KeychainStorageService {

    func set<T: Encodable>(value: T, forKey key: KeychainKey) throws {
        guard let data = try? encoder.encode(value) else {
            throw KeychainServiceError.encodingError
        }

        do {
            try keychain.set(data, key: key.rawValue)
        } catch {
            throw KeychainServiceError.savingError
        }
    }

    func getValue<T: Decodable>(forKey key: KeychainKey) throws -> T {
        guard let data = try? keychain.getData(key.rawValue) else {
            throw KeychainServiceError.gettingError
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw KeychainServiceError.decodingError
        }
    }

    func deleteValue(forKey key: KeychainKey) throws {
        do {
            try keychain.remove(key.rawValue)
        } catch {
            throw KeychainServiceError.deletingError
        }
    }

}
