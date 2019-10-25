//
//  Created by Dmitry Ivanenko on 17.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension CategoriesGridView {
    struct AddButton: View {

        private let cornerRadius: CGFloat = 12
        private let interitemSpacing: CGFloat = 9
        private let horizontalPadding: CGFloat = 16

        let action: () -> Void

        var body: some View {
            Button(action: action) {
                VStack {
                    Text("Добавить")
                        .font(Font.Rubik.Regular(size: 11))
                        .foregroundColor(Color.Categories.plusTitle)
                        .padding(.horizontal, 4)
                        .padding(.top, 8)

                    Spacer()
                    
                    Image.Categories.plus
                        .resizable()
                        .frame(width: 43, height: 43)
                        .foregroundColor(Color.Categories.plusIcon)
                        .padding(.bottom, 20)
                }
                .frame(width: (UIScreen.main.bounds.width - horizontalPadding * 2 - 3 * interitemSpacing) / 4, height: 97)
                .background(Color.secondaryBackground.cornerRadius(cornerRadius))
            }
            .buttonStyle(ScaledButtonStyle())
        }
    }
}
