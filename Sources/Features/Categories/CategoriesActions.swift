//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension CategoriesFeature {
    enum Actions {

        struct StartLoading: Action {

        }

        struct SelectCategory: Action {
            let id: Category.ID
        }

        struct ClearSelectedCategory: Action {

        }

        struct SetCategories: Action {
            let categories: [Category]
        }

        struct LoadCategories: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                let categories = [
                    Category(id: UUID(), title: "Категория 1", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 2", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 3", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 4", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 5", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 6", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 7", icon: .random(), style: .random()),
                    Category(id: UUID(), title: "Категория 8", icon: .random(), style: .random()),
                ]
                dispatch(Actions.SetCategories(categories: categories))
            }
        }

    }
}

