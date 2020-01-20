//
//  Created by Dmitry Ivanenko on 25.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


final class CategoriesService : CategoriesServiceProtocol {
    private lazy var categories = DBTable<Category>(collection: "categories")
}


// MARK: - CategoriesServiceProtocol

extension CategoriesService {

    func load(completed: @escaping ((Result<[Category], Error>) -> Void)) {
        categories.loadAll(completed: completed)
    }

    func save(_ model: Category, completed: @escaping ((Result<Category, Error>) -> Void)) {
        categories.save(model, by: model.id.uuidString, completed: completed)
    }

    func delete(_ id: Category.ID, completed: @escaping ((Result<Void, Error>) -> Void)) {
        categories.delete(id.uuidString, completed: completed)
    }

}
