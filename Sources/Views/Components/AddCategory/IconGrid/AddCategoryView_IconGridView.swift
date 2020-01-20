//
//  Created by Dmitry Ivanenko on 10/25/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView {
    struct IconGridView: View {

        let icons: [Category.Icon]
        @Binding var style: Category.Style
        @Binding var selectedIcon: Category.Icon

        var body: some View {
            let rows = icons.splitByRows(numberOfRows: 3).mapToIdentity()

            return ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(rows) { row in
                        Row(
                            icons: row.elements,
                            primaryColor: self.style.primaryColor,
                            selectedIcon: self.$selectedIcon
                        )
                    }
                }
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, -16)
        }

    }
}


#if DEBUG
struct AddCategoryView_IconGridView_Preview: PreviewProvider {

    private static let icons: [Category.Icon] = [
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
        .random(),
    ]
    @State static var selectedStyle = Category.Style.random()
    @State static var selectedIcon = icons.randomElement()!

    static var previews: some View {
        AddCategoryView.IconGridView(
            icons: icons,
            style: $selectedStyle,
            selectedIcon: $selectedIcon
        )
            .previewLayout(.sizeThatFits)
            .padding(8)
    }

}
#endif
