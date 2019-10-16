//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension CategoriesGridView {
    struct Cell: ConnectedView {

        struct Props {
            let title: String
            let value: Double
            let isSelected: Bool
            let icon: Category.Icon
            let style: Category.Style
            let dispatch: DispatchFunction
            let selectCategoryAction: Action?
        }

        let categoryId: Category.ID


        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            let category = state.categoriesState.categories[categoryId]!

            var selectCategoryAction: Action?
            if state.categoriesState.selectedCategory != categoryId {
                selectCategoryAction = CategoriesFeature.Actions.SelectCategory(id: self.categoryId)
            }

            let value = state.transactionsState.transactionsForCategory(categoryId).reduce(0) { (result, transaction) -> Double in
                result + transaction.value
            }

            return Props(
                title: category.title,
                value: value,
                isSelected: category.id == state.categoriesState.selectedCategory,
                icon: category.icon,
                style: category.style,
                dispatch: dispatch,
                selectCategoryAction: selectCategoryAction
            )
        }

        func body(props: CategoriesGridView.Cell.Props) -> some View {
            Button(action: {
                if let action = props.selectCategoryAction {
                    props.dispatch(action)
                }
            }) {
                VStack {
                    Spacer(minLength: 8)

                    Text(props.title)
                        .font(Font.Rubik.Regular(size: 11))
                        .foregroundColor(props.titleColor)
                        .padding(.horizontal, 4)

                    props.iconCircleColor
                        .clipShape(Circle())
                        .overlay(props.image)
                        .frame(width: 40, height: 40)

                    Text("\(NSNumber(value: props.value), formatter: NumberFormatter.currency)")
                        .font(Font.Rubik.Medium(size: 11))
                        .foregroundColor(props.valueColor)
                        .padding(.horizontal, 4)

                    Spacer(minLength: 8)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 97)
                .background(props.backgroundColor.cornerRadius(4))
            }
            .buttonStyle(ScaledButtonStyle())
            .disabled(props.selectCategoryAction == nil)
        }

    }
}


fileprivate extension CategoriesGridView.Cell.Props {

    var image: some View {
        return icon.image
            .resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
            .foregroundColor(iconColor)
    }

    var titleColor: Color {
        return isSelected ? .background : style.primaryColor
    }

    var iconCircleColor: Color {
        return isSelected ? .background : style.primaryColor
    }

    var iconColor: Color {
        return isSelected ? style.primaryColor : .background
    }

    var valueColor: Color {
        return isSelected ? .background : .secondaryLabel
    }

    var backgroundColor: Color {
        return isSelected ? style.primaryColor : .secondaryBackground
    }

}
