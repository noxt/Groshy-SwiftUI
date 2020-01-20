//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView.IconGridView {
    struct Item: View {

        let iconImage: Image
        let primaryColor: Color
        let isSelected: Bool

        var body: some View {
            iconCircleColor
                .clipShape(Circle())
                .overlay(image)
                .frame(width: 50, height: 50)
        }


        private var image: some View {
            return iconImage
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(iconColor)
        }

        private var iconCircleColor: Color {
            return isSelected ? primaryColor : .background
        }

        private var iconColor: Color {
            return isSelected ? .background : .button
        }

    }
}


#if DEBUG
struct AddCategoryView_IconGridView_Item_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AddCategoryView.IconGridView.Item(
                iconImage: Category.Icon.random().image,
                primaryColor: Category.Style.random().primaryColor,
                isSelected: false
            )
                .previewLayout(.sizeThatFits)
                .padding(8)

            AddCategoryView.IconGridView.Item(
                iconImage: Category.Icon.random().image,
                primaryColor: Category.Style.random().primaryColor,
                isSelected: true
            )
                .previewLayout(.sizeThatFits)
                .padding(8)
        }
    }
}
#endif
