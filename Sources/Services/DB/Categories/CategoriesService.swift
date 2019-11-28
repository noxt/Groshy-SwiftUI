//
//  Created by Dmitry Ivanenko on 25.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase


final class CategoriesService : DBService, CategoriesServiceProtocol {

    typealias Model = Category

    private lazy var categoriesRef = {
        db.child("categories")
    }()

}



// MARK: - DBCRUDServiceProtocol

extension CategoriesService {

    func load(completed: @escaping ((Result<[Category], CRUDServiceError>) -> Void)) {
        categoriesRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value else {
                completed(.success([]))
                return
            }

            do {
                let categories = try FirebaseDecoder().decode([String: Category].self, from: value)
                completed(.success(Array(categories.values)))
            } catch let error {
            }
        }
    }

    func save(_ model: Category, completed: ((Result<Category, CRUDServiceError>) -> Void)) {
        let data = try! FirebaseEncoder().encode(model)
        categoriesRef.setValue(data, forKey: model.id.uuidString)
    }

    func delete(_ id: Category.ID, completed: ((Result<UUID, CRUDServiceError>) -> Void)) {
        categoriesRef.child(id.uuidString).removeValue()
    }

}
