//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension HomeView {
    struct HeaderView: View {

        let value: Double
        let filter: TransactionFilter
        let changeFilter: (TransactionFilter) -> Void

        @State private var isFilterSelectPresented = false

        var body: some View {
            VStack {
                HStack {
                    Text("\(NSNumber(value: value), formatter: NumberFormatter.byn)")
                        .font(.caption).fontWeight(.heavy)
                        .foregroundColor(.secondaryLabel)
                    Spacer()
                }
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("Расходы")
                        .font(.title).fontWeight(.heavy)
                        .foregroundColor(.label)

                    Button(action: { self.isFilterSelectPresented = true }) {
                        Text(filter.title)
                            .font(.headline).fontWeight(.heavy)
                            .foregroundColor(.primaryColor)
                    }

                    Spacer()
                }
            }
            .actionSheet(isPresented: $isFilterSelectPresented) { () -> ActionSheet in
                var buttons = TransactionFilter.allCases.map { (filter) -> ActionSheet.Button in
                    .default(Text(filter.title)) {
                        self.changeFilter(filter)
                    }
                }
                buttons.append(.cancel(Text("Отмена")))
                return ActionSheet(title: Text("Видеть расходы"), message: nil, buttons: buttons)
            }
        }
    }
}

