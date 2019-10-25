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

        struct SaveCategory: Action {
            let category: Category
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
                    Category(id: UUID(), title: "Продукты", icon: .products, style: .init(number: 1)),
                    Category(id: UUID(), title: "Покупки", icon: .tShirt, style: .init(number: 2)),
                    Category(id: UUID(), title: "Авто", icon: .car, style: .init(number: 3)),
                    Category(id: UUID(), title: "Развлечения", icon: .entertaiment, style: .init(number: 4)),
                    Category(id: UUID(), title: "Рестораны", icon: .restaurants, style: .init(number: 6)),
                    Category(id: UUID(), title: "Отпуск", icon: .plane, style: .init(number: 5)),
                    Category(id: UUID(), title: "Подарки", icon: .presents, style: .init(number: 7)),
                ]
                dispatch(Actions.SetCategories(categories: categories))
            }
        }

    }
}

