//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension CategoriesFeature {
    enum Actions {

        struct LoadCategories: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
//                serviceLocator.categoriesService.load { (result) in
//                    switch result {
//                    case .success(let categories):
//                        dispatch(Actions.SetCategories(categories: categories))
//                    case .failure(let error):
//                        print("[Error][LoadCategories] \(error)")
//                    }
//                }

                //                let categories = [
                //                    Category(id: UUID(), title: "Продукты", icon: .products, style: .init(number: 1)),
                //                    Category(id: UUID(), title: "Покупки", icon: .tShirt, style: .init(number: 2)),
                //                    Category(id: UUID(), title: "Авто", icon: .car, style: .init(number: 3)),
                //                    Category(id: UUID(), title: "Развлечения", icon: .entertaiment, style: .init(number: 4)),
                //                    Category(id: UUID(), title: "Рестораны", icon: .restaurants, style: .init(number: 6)),
                //                    Category(id: UUID(), title: "Отпуск", icon: .plane, style: .init(number: 5)),
                //                    Category(id: UUID(), title: "Подарки", icon: .presents, style: .init(number: 7)),
                //                ]
                //                dispatch(Actions.SetCategories(categories: categories))
            }
        }

        struct SaveCategory: AsyncAction {
            let category: Category

            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                dispatch(Actions.SelectCategory(id: category.id))

//                
//                serviceLocator.categoriesService.save(category) { (result) in
//                    switch result {
//                    case let .success(category):
//                        dispatch(Actions.SelectCategory(id: category.id))
//                    case let .failure(error):
//                        print("[Error][SaveCategory] \(error)")
//                    }
//                }
            }
        }

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

    }
}

