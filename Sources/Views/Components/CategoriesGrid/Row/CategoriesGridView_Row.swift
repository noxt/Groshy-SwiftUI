//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension CategoriesGridView {
    struct Row: View {

        let categories: [Category.ID]
        let showAddButton: Bool
        let itemSize: CGSize
        @State private var isAddCategoryPresented = false

        var body: some View {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { id in
                    Cell.Component(categoryId: id)
                        .frame(width: self.itemSize.width, height: self.itemSize.height)
                }
                if showAddButton {
                    AddButton {
                        self.isAddCategoryPresented = true
                    }
                    .frame(width: itemSize.width, height: itemSize.height)
                }
            }
            .frame(height: itemSize.height)
            .sheet(isPresented: self.$isAddCategoryPresented, content: {
                AddCategoryView.Component().environmentObject(store)
            })
        }

    }
}
