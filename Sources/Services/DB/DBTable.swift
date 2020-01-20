//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//import CodableFirebase


final class DBTable<Model: Codable> {

    private let collection: String
    private lazy var ref = Firestore.firestore().collection(collection)


    init(collection: String) {
        self.collection = collection
    }

}


extension DBTable {

    func load(id: String, completed: @escaping ((Result<Model?, Error>) -> Void)) {
        ref.document(id).getDocument { (snapshot, error) in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            
            do {
                let model = try snapshot?.data(as: Model.self)
                completed(.success(model))
            } catch {
                completed(.failure(error))
            }
        }
    }

    func loadAll(completed: @escaping ((Result<[Model], Error>) -> Void)) {
        ref.getDocuments { (querySnapshot, error) in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            guard let models = querySnapshot?.documents.compactMap({ try? $0.data(as: Model.self) }) else {
                completed(.success([]))
                return
            }
            completed(.success(models))
        }
    }

    func save(_ model: Model, by id: String, completed: @escaping ((Result<Model, Error>) -> Void)) {
        do {
            try ref.document(id).setData(from: model) { (error) in
                if let error = error {
                    completed(.failure(error))
                } else {
                    completed(.success(model))
                }
            }
        } catch {
            completed(.failure(error))
        }
    }

    func delete(_ id: String, completed: @escaping ((Result<Void, Error>) -> Void)) {
        ref.document(id).delete { (error) in
            if let error = error {
                completed(.failure(error))
            } else {
                completed(.success(()))
            }
        }
    }

}
