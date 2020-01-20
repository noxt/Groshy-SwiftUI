//
//  Created by Dmitry Ivanenko on 21.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol SyncServiceProtocol {

    typealias State = AppFeature.State

    func loadState(for user: String, completed: @escaping ((Result<State?, Error>) -> Void))
    func saveState(for user: String, state: State, completed: @escaping ((Result<State, Error>) -> Void))

}
