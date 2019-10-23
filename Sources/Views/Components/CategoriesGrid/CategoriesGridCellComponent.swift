//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct CategoriesGridCellComponent: ConnectedView {

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

        return CategoriesGridCellView(
            title: props.title,
            value: props.value,
            icon: props.icon,
            style: props.style,
            isSelected: props.isSelected,
            selectCategoryAction: selectCategoryAction
        )
    }

}


struct CategoriesGridCellView: View {

    private let cornerRadius: CGFloat = 12
    private let interitemSpacing: CGFloat = 9
    private let horizontalPadding: CGFloat = 16

    let title: String
    let value: Double
    let icon: Category.Icon
    let style: Category.Style
    let isSelected: Bool
    let selectCategoryAction: (() -> Void)?

    var body: some View {
        Button(action: {
            self.selectCategoryAction?()
        }) {
            VStack {
                Spacer(minLength: 8)

                Text(title)
                    .font(Font.Rubik.Regular(size: 11))
                    .foregroundColor(titleColor)
                    .padding(.horizontal, 4)

                Spacer(minLength: 4)

                iconCircleColor
                    .clipShape(Circle())
                    .overlay(image)
                    .frame(width: 40, height: 40)

                Spacer(minLength: 6)

                Text("\(NSNumber(value: value), formatter: NumberFormatter.currency)")
                    .font(Font.Rubik.Medium(size: 11))
                    .foregroundColor(valueColor)
                    .padding(.horizontal, 4)
                    .padding(.bottom, 8)
            }
            .frame(width: (UIScreen.main.bounds.width - horizontalPadding * 2 - 3 * interitemSpacing) / 4, height: 97)
            .background(backgroundColor.cornerRadius(cornerRadius))
        }
        .buttonStyle(ScaledButtonStyle())
        .disabled(selectCategoryAction == nil)
    }

}


private extension CategoriesGridCellView {

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
