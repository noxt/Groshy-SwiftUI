//
//  Created by Dmitry Ivanenko on 19.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol CategoriesServiceProtocol {
    
    func load(completed: @escaping ((Result<[Category], Error>) -> Void))
    func save(_ model: Category, completed: @escaping ((Result<Category, Error>) -> Void))
    func delete(_ id: Category.ID, completed: @escaping ((Result<Void, Error>) -> Void))

}
