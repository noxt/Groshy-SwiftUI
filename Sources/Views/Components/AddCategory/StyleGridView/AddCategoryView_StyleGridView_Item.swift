//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView.StyleGridView {
    struct Item: View {

        let color: Color
        let isSelected: Bool

        var body: some View {
            color
                .clipShape(Circle())
                .frame(width: 16, height: 16)
                .padding(6)
                .overlay(Circle().stroke(lineWidth: 3).foregroundColor(borderColor))
        }

        private var borderColor: Color? {
            return isSelected ? .button : .background
        }

    }
}


#if DEBUG
struct AddCategoryView_StyleGridView_Item_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AddCategoryView.StyleGridView.Item(
                color: Category.Style.random().primaryColor,
                isSelected: false
            )
                .previewLayout(.sizeThatFits)
                .padding(8)

            AddCategoryView.StyleGridView.Item(
                color: Category.Style.random().primaryColor,
                isSelected: true
            )
                .previewLayout(.sizeThatFits)
                .padding(8)
        }
    }
}
#endif
