//
//  Created by Dmitry Ivanenko on 10/25/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct AddCategoryIconGridView: View {

    struct RowData: Identifiable {
        let id: Int
        var icons: [Category.Icon]
    }

    let icons: [Category.Icon]
    @Binding var style: Category.Style
    @Binding var selectedIcon: Category.Icon

    var body: some View {
        let rows = splitIconsByRows(icons)

        return ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(rows) { row in
                    Row(
                        icons: row.icons,
                        style: self.$style,
                        selectedIcon: self.$selectedIcon
                    )
                }
            }
            .padding(.horizontal, 8)
        }
        .padding(.horizontal, -16)
    }

    private func splitIconsByRows(_ icons: [Category.Icon], numberOfRows: Int = 3) -> [RowData] {
        var rows: [RowData] = []

        for id in 0..<numberOfRows {
            rows.append(RowData(id: id, icons: []))
        }

        for (index, icon) in icons.enumerated() {
            rows[index % numberOfRows].icons.append(icon)
        }

        return rows
    }

}


fileprivate extension AddCategoryIconGridView {
    struct Row: View {

        let icons: [Category.Icon]
        @Binding var style: Category.Style
        @Binding var selectedIcon: Category.Icon

        var body: some View {
            HStack(spacing: 8) {
                ForEach(icons, id: \.self) { icon in
                    Button(action: { self.selectedIcon = icon }) {
                        Item(
                            icon: icon,
                            style: self.$style,
                            isSelected: icon == self.selectedIcon
                        )
                    }
                    .buttonStyle(ScaledButtonStyle())
                }
            }
        }
    }
}


fileprivate extension AddCategoryIconGridView {
    struct Item: View {

        let icon: Category.Icon
        @Binding var style: Category.Style
        let isSelected: Bool

        var body: some View {
            iconCircleColor
                .clipShape(Circle())
                .overlay(image)
                .frame(width: 50, height: 50)
        }


        private var image: some View {
            return icon.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(iconColor)
        }

        private var iconCircleColor: Color {
            return isSelected ? style.primaryColor : .background
        }

        private var iconColor: Color {
            return isSelected ? .background : .button
        }

    }
}

