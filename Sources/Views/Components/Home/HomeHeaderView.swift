//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct HomeHeaderView: ConnectedView {

    struct Props {
        let value: Double
    }

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        let value = state.transactionsState.filteredTransactions.reduce(0) { (result, transaction) -> Double in
            result + transaction.value
        }

        return Props(
            value: value
        )
    }

    func body(props: Props) -> some View {
        VStack {
            HStack {
                Text("\(NSNumber(value: props.value), formatter: NumberFormatter.byn)")
                    .font(.caption).fontWeight(.heavy)
                    .foregroundColor(.secondaryLabel)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text("Расходы")
                    .font(.title).fontWeight(.heavy)
                    .foregroundColor(.label)

                Button(action: {}) {
                    Text("за день")
                        .font(.headline).fontWeight(.heavy)
                        .foregroundColor(.primaryColor)
                }

                Spacer()
            }
        }
    }
}
