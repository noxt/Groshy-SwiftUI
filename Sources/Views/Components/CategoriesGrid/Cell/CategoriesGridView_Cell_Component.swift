//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension CategoriesGridView.Cell {
    struct Component: ConnectedView {

        struct Props {
            let title: String
            let value: Double
            let icon: Category.Icon
            let style: Category.Style
            let isSelected: Bool
            let dispatch: DispatchFunction
        }

        let categoryId: Category.ID


        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            let category = state.categoriesState.categories[categoryId]!

            let value = state.transactionsState.transactionsForCategory(categoryId).reduce(0) { (result, transaction) -> Double in
                result + transaction.value
            }

            return Props(
                title: category.title,
                value: value,
                icon: category.icon,
                style: category.style,
                isSelected: category.id == state.categoriesState.selectedCategory,
                dispatch: dispatch
            )
        }


        func body(props: Props) -> some View {
            var selectCategoryAction: (() -> Void)?
            if !props.isSelected {
                selectCategoryAction = {
                    props.dispatch(CategoriesFeature.Actions.SelectCategory(id: self.categoryId))
                }
            }

            return CategoriesGridView.Cell(
                title: props.title,
                value: props.value,
                icon: props.icon,
                style: props.style,
                isSelected: props.isSelected,
                selectCategoryAction: selectCategoryAction
            )
        }

    }
}
