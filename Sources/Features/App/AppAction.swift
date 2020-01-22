//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension AppFeature {
    enum Actions {

        struct LoadState: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                serviceLocator.syncService.loadState(for: "user 1") { (result) in
                    switch result {
                    case let .success(state):
                        store.state = state ?? AppFeature.State.initial
                    case let .failure(error):
                        print("[Error][LoadState] \(error)")
                    }
                }
            }
        }

        struct SaveState: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                serviceLocator.syncService.saveState(for: "user 1", state: state as! AppFeature.State) { (result) in
                    switch result {
                    case .success:
                        print("[Success][SaveState]")
                    case let .failure(error):
                        print("[Error][SaveState] \(error)")
                    }
                }
            }
        }

        struct WillEnterForeground: Action {

        }

        struct DidEnterBackground: Action {

        }

    }
}
