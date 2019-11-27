//
//  Created by Dmitry Ivanenko on 25.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol CRUDServiceProtocol {

    associatedtype Model: Identifiable

    func load(completed: ((Result<Model, CRUDServiceError>) -> Void))
    func save(_ model: Model, completed: ((Result<Model, CRUDServiceError>) -> Void))
    func delete(_ id: Model.ID, completed: ((Result<Model.ID, CRUDServiceError>) -> Void))

}
