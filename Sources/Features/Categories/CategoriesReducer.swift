//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension CategoriesFeature {
    static func reduce(state: State, action: Action) -> State {
        var state = state

        state.isLoading = false
        state.error = nil

        switch action {

        case is Actions.LoadCategories:
            state.isLoading = true

        case is Actions.ClearSelectedCategory:
            state.selectedCategory = nil

        case let action as Actions.SelectCategory:
            state.selectedCategory = action.id

        case let action as Actions.SetCategoriesList:
            state.categories = action.categories.normalized
            state.sortOrder = action.categories.map({ $0.id })

        default:
            break
        }
        return state
    }
}
