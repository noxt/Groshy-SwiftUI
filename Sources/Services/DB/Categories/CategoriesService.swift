//
//  Created by Dmitry Ivanenko on 25.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//import CodableFirebase


final class CategoriesService : DBService, CategoriesServiceProtocol {

    typealias Model = Category

    private lazy var categoriesDB = {
        Firestore.firestore().collection("categories")
    }()

}



// MARK: - DBCRUDServiceProtocol

extension CategoriesService {

    func load(completed: @escaping ((Result<[Category], Error>) -> Void)) {
        categoriesDB.getDocuments { (querySnapshot, error) in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            let categories = querySnapshot!.documents.map { (document) -> Category in
                let data = document.data()
                return Category(
                    id: UUID(uuidString: document.documentID)!,
                    title: data["title"] as! String,
                    icon: Category.Icon(rawValue: data["icon"] as! String)!,
                    style: Category.Style(number: data["style"] as! Int)
                )
            }
            completed(.success(categories))
        }
    }

    func save(_ model: Category, completed: @escaping ((Result<Category, Error>) -> Void)) {
        let data: [String : Any] = [
            "title": model.title,
            "icon": model.icon.rawValue,
            "style": model.style.number
        ]
        categoriesDB.document(model.id.uuidString).setData(data) { (error) in
            if let error = error {
                completed(.failure(error))
            } else {
                completed(.success(model))
            }
        }
    }

    func delete(_ id: Category.ID, completed: @escaping ((Result<UUID, Error>) -> Void)) {
        categoriesDB.document(id.uuidString).delete { (error) in
            if let error = error {
                completed(.failure(error))
            } else {
                completed(.success(id))
            }
        }
    }

}
