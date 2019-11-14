//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct CategoriesGridView: View {

    let categories: [Category.ID]
    private let interitemSpacing: CGFloat = 9

    var body: some View {
        let rows = categories.splitByRows(numberOfRows: 2).mapToIdentity()

        return GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: self.interitemSpacing) {
                    ForEach(rows) { row in
                        Row(
                            categories: row.elements,
                            showAddButton: self.showAddButton(for: row.id),
                            itemSize: self.itemSize(for: geometry)
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -16)
        }
    }

    private func showAddButton(for index: Int) -> Bool {
        return categories.count % 2 == index
    }

    private func itemSize(for geometry: GeometryProxy) -> CGSize {
        return CGSize(
            width: (geometry.size.width - 3 * interitemSpacing) / 4,
            height: 97
        )
    }

}
