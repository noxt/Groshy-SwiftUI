//
//  Created by Dmitry Ivanenko on 08.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension CategoriesGridView {
    struct Row: View {
        let items: [Category.ID]
        let showAddButton: Bool

        var body: some View {
            HStack(spacing: 10) {
                ForEach(items, id: \.self) { id in
                    Cell(categoryId: id)
                }
                if showAddButton {
                    AddButton()
                }
            }
        }
    }
}
