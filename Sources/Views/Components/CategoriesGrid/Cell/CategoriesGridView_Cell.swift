//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension CategoriesGridView {
    struct Cell: View {

        private let cornerRadius: CGFloat = 12

        let title: String
        let value: Double
        let icon: Category.Icon
        let style: Category.Style
        let isSelected: Bool
        let selectCategoryAction: (() -> Void)?

        var body: some View {
            GeometryReader { geometry in
                Button(action: {
                    self.selectCategoryAction?()
                }) {
                    VStack {
                        Spacer(minLength: 8)

                        Text(self.title)
                            .font(Font.Rubik.Regular(size: 11))
                            .foregroundColor(self.titleColor)
                            .padding(.horizontal, 4)

                        Spacer(minLength: 4)

                        self.iconCircleColor
                            .clipShape(Circle())
                            .overlay(self.image)
                            .frame(width: 40, height: 40)

                        Spacer(minLength: 6)

                        Text("\(NSNumber(value: self.value), formatter: NumberFormatter.currency)")
                            .font(Font.Rubik.Medium(size: 11))
                            .foregroundColor(self.valueColor)
                            .padding(.horizontal, 4)
                            .padding(.bottom, 8)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(self.backgroundColor.cornerRadius(self.cornerRadius))
                }
                .buttonStyle(ScaledButtonStyle())
                .disabled(self.selectCategoryAction == nil)
            }
        }

    }
}


private extension CategoriesGridView.Cell {

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


#if DEBUG
struct CategoriesGridView_Cell_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesGridView.Cell(
                title: "Продукты",
                value: 12.34,
                icon: .products,
                style: .random(),
                isSelected: false,
                selectCategoryAction: {}
            )
                .previewLayout(.sizeThatFits)
                .frame(height: 97)
                .padding(8)

            CategoriesGridView.Cell(
                title: "Продукты",
                value: 12.34,
                icon: .products,
                style: .random(),
                isSelected: true,
                selectCategoryAction: {}
            )
                .previewLayout(.sizeThatFits)
                .frame(height: 97)
                .padding(8)
        }
    }
}
#endif
