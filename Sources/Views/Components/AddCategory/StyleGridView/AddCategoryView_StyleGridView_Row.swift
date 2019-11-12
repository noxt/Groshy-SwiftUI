//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddCategoryView.StyleGridView {
    struct Row: View {
        let styles: [Category.Style]
        @Binding var selectedStyle: Category.Style

        var body: some View {
            HStack(spacing: 18) {
                ForEach(styles, id: \.self) { style in
                    Button(action: { self.selectedStyle = style }) {
                        Item(
                            color: style.primaryColor,
                            isSelected: style == self.selectedStyle
                        )
                    }
                    .buttonStyle(ScaledButtonStyle())
                }
            }
        }

    }
}


#if DEBUG
struct AddCategoryView_StyleGridView_Row_Preview: PreviewProvider {

    private static let styles: [Category.Style] = [
        .random(),
        .random(),
        .random(),
        .random(),
    ]
    @State private static var selectedStyle = styles.randomElement()!

    static var previews: some View {
        AddCategoryView.StyleGridView.Row(
            styles: styles,
            selectedStyle: $selectedStyle
        )
            .previewLayout(.sizeThatFits)
            .padding(8)
    }

}
#endif
