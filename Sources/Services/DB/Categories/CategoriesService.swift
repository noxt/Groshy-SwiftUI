//
//  Created by Dmitry Ivanenko on 25.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


final class CategoriesService : DBService, CategoriesServiceProtocol {

    typealias Model = Category

}



// MARK: - DBCRUDServiceProtocol

extension CategoriesService {

    func load(completed: ((Result<Category, CRUDServiceError>) -> Void)) {

    }

    func save(_ model: Category, completed: ((Result<Category, CRUDServiceError>) -> Void)) {

    }

    func delete(_ id: Category.ID, completed: ((Result<UUID, CRUDServiceError>) -> Void)) {

    }

}
