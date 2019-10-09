//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension AppFeature {
    static func reduce(state: State, action: Action) -> State {
        var state = state
        state.keyboardState = KeyboardFeature.reduce(state: state.keyboardState, action: action)
        state.categoriesState = CategoriesFeature.reduce(state: state.categoriesState, action: action)
        return state
    }
}
