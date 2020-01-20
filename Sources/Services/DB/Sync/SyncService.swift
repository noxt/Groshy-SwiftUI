//
//  Created by Dmitry Ivanenko on 21.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import Foundation


final class SyncService : SyncServiceProtocol {
    private lazy var states = DBTable<State>(collection: "states")
}


// MARK: - SyncServiceProtocol

extension SyncService {

    func loadState(for user: String, completed: @escaping ((Result<State?, Error>) -> Void)) {
        states.load(id: user, completed: completed)
    }

    func saveState(for user: String, state: State, completed: @escaping ((Result<State, Error>) -> Void)) {
        states.save(state, by: user, completed: completed)
    }

}
