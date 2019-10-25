//
//  Created by Dmitry Ivanenko on 10/25/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct AddCategoryStyleGridView: View {

    struct RowData: Identifiable {
        let id: Int
        var styles: [Category.Style]
    }

    let styles: [Category.Style]
    @Binding var selectedStyle: Category.Style

    var body: some View {
        let rows = splitStylesByRows(styles)

        return VStack(alignment: .leading, spacing: 12) {
            ForEach(rows) { row in
                Row(
                    styles: row.styles,
                    selectedStyle: self.$selectedStyle
                )
            }
        }
        .padding(.horizontal, -8)
    }

    private func splitStylesByRows(_ styles: [Category.Style], numberOfRows: Int = 2) -> [RowData] {
        var rows: [RowData] = []

        for id in 0..<numberOfRows {
            rows.append(RowData(id: id, styles: []))
        }

        for (index, style) in styles.enumerated() {
            rows[index % numberOfRows].styles.append(style)
        }

        return rows
    }

}


fileprivate extension AddCategoryStyleGridView {
    struct Row: View {

        let styles: [Category.Style]
        @Binding var selectedStyle: Category.Style

        var body: some View {
            HStack(spacing: 18) {
                ForEach(styles, id: \.self) { style in
                    Button(action: { self.selectedStyle = style }) {
                        Item(
                            style: style,
                            isSelected: style == self.selectedStyle
                        )
                    }
                }
            }
        }
    }
}


fileprivate extension AddCategoryStyleGridView {
    struct Item: View {

        let style: Category.Style
        let isSelected: Bool

        var body: some View {
            style.primaryColor
                .clipShape(Circle())
                .frame(width: 16, height: 16)
                .padding(6)
                .overlay(Circle().stroke(lineWidth: 3).foregroundColor(borderColor))
        }

        private var borderColor: Color? {
            return isSelected ? .button : .background
        }

    }
}

