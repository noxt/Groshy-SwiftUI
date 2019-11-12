//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView.IconGridView {
    struct Row: View {

        let icons: [Category.Icon]
        let primaryColor: Color
        @Binding var selectedIcon: Category.Icon

        var body: some View {
            HStack(spacing: 8) {
                ForEach(icons, id: \.self) { icon in
                    Button(action: { self.selectedIcon = icon }) {
                        Item(
                            iconImage: icon.image,
                            primaryColor: self.primaryColor,
                            isSelected: icon == self.selectedIcon
                        )
                    }
                    .buttonStyle(ScaledButtonStyle())
                }
            }
        }

    }
}


#if DEBUG
struct AddCategoryView_IconGridView_Row_Preview: PreviewProvider {
    static let icons: [Category.Icon] = [
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
    ]
    @State static var selectedIcon = icons.randomElement()!

    static var previews: some View {
        AddCategoryView.IconGridView.Row(
            icons: icons,
            primaryColor: Category.Style.random().primaryColor,
            selectedIcon: $selectedIcon
        )
            .previewLayout(.sizeThatFits)
            .padding(8)
    }
}
#endif
