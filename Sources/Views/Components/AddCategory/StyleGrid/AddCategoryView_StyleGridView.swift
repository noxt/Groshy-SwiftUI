//
//  Created by Dmitry Ivanenko on 10/25/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView {
    struct StyleGridView: View {

        let styles: [Category.Style]
        @Binding var selectedStyle: Category.Style

        var body: some View {
            let rows = styles.splitByRows(numberOfRows: 2).mapToIdentity()

            return VStack(alignment: .leading, spacing: 12) {
                ForEach(rows) { row in
                    Row(
                        styles: row.elements,
                        selectedStyle: self.$selectedStyle
                    )
                }
            }
            .padding(.horizontal, -8)
        }

    }
}


#if DEBUG
struct AddCategoryView_StyleGridView_Preview: PreviewProvider {

    private static let styles: [Category.Style] = [
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
    @State private static var selectedStyle = styles.randomElement()!

    static var previews: some View {
        AddCategoryView.StyleGridView(
            styles: styles,
            selectedStyle: $selectedStyle
        )
            .previewLayout(.sizeThatFits)
            .padding(8)
    }

}
#endif
