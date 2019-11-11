//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct CategoriesGridViewComponent: ConnectedView {

    struct Props {
        let rows: [CategoriesGridView.Row]
        let dispatch: DispatchFunction
    }

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        let categories = state.categoriesState.sortOrder.compactMap { (id) -> Category? in
            state.categoriesState.categories[id]
        }

        return Props(
            rows: splitCategoriesByRows(categories),
            dispatch: dispatch
        )
    }

    func body(props: CategoriesGridViewComponent.Props) -> some View {
        CategoriesGridView(
            rows: props.rows
        )
    }


    private func splitCategoriesByRows(_ categories: [Category], numberOfRows: Int = 2) -> [CategoriesGridView.Row] {
        var rows: [CategoriesGridView.Row] = []

        for id in 0..<numberOfRows {
            rows.append(CategoriesGridView.Row(id: id, categories: [], showAddButton: categories.count % numberOfRows == id))
        }

        for (index, category) in categories.enumerated() {
            rows[index % numberOfRows].categories.append(category.id)
        }

        return rows
    }

}


struct CategoriesGridView: View {

    struct Row: Identifiable {
        let id: Int
        var categories: [Category.ID]
        var showAddButton: Bool
    }

    let rows: [Row]

    @State private var isAddCategoryPresented = false

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 9) {
                ForEach(rows) { row in
                    self.CategoriesRow(categories: row.categories, showAddButton: row.showAddButton)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, -16)
        .sheet(isPresented: $isAddCategoryPresented) {
            AddCategoryViewComponent().environmentObject(store)
        }
    }

    private func CategoriesRow(categories: [Category.ID], showAddButton: Bool) -> some View {
        HStack(spacing: 10) {
            ForEach(categories, id: \.self) { id in
                CategoriesGridCellComponent(categoryId: id)
            }
            if showAddButton {
                AddButton {
                    self.isAddCategoryPresented = true
                }
            }
        }
        .frame(height: 97)
    }

}
