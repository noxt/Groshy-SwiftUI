//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct AddCategoryView: View {

    let createCategory: (String, Category.Icon, Category.Style) -> Void
    let dismiss: () -> Void

    @State private var title = ""
    @State private var icon = Category.Icon.random()
    @State private var style = Category.Style.random()

    var body: some View {
        VStack {
            HStack {
                ImageButton(image: Image.Buttons.cancel, action: dismiss)
                    .offset(x: -10, y: -10)
                Spacer()
                ImageButton(image: Image.Buttons.save, action: saveCategory)
                    .offset(x: 10, y: -10)
                    .disabled(title.isEmpty)
                    .opacity(title.isEmpty ? 0.7 : 1)
            }

            TextField("Категория", text: $title, onCommit: saveCategory)
                .keyboardType(.default)
                .autocapitalization(.words)
                .disableAutocorrection(true)
                .font(Font.Rubik.Bold(size: 30))
                .foregroundColor(.label)

            Spacer()

            IconGridView(
                icons: Category.Icon.allCases,
                style: $style,
                selectedIcon: $icon
            )

            Spacer()

            StyleGridView(
                styles: Category.Style.allCases,
                selectedStyle: $style
            )
        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

    private func saveCategory() {
        createCategory(title, icon, style)
        dismiss()
    }

}
