//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import KeychainAccess


final class KeychainAccessService {

    private let keychain: Keychain
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(
        keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!),
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.keychain = keychain
        self.encoder = encoder
        self.decoder = decoder
    }

}


extension KeychainAccessService: KeychainServiceProtocol {

    func setValue<T>(_ value: T, forKey key: String, complete: (Result<T, KeychainServiceError>) -> Void) where T : Encodable {
        guard let data = try? encoder.encode(value) else {
            complete(.failure(.savingError))
            return
        }

        do {
            try keychain.set(data, key: key)
            complete(.success(value))
        } catch {
            complete(.failure(.savingError))
        }
    }

    func getValue<T>(forKey key: String, complete: (Result<T, KeychainServiceError>) -> Void) where T : Decodable {
        guard let data = try? keychain.getData(key) else {
            complete(.failure(.gettingError))
            return
        }

        do {
            complete(.success(try decoder.decode(T.self, from: data)))
        } catch {
            complete(.failure(.decodingError))
        }
    }

    func deleteValue(forKey key: String, complete: (Result<Void, KeychainServiceError>) -> Void) {
        do {
            try keychain.remove(key)
            complete(.success(()))
        } catch {
            complete(.failure(.deletingError))
        }
    }

}
