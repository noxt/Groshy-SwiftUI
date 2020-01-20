//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension HomeView.HeaderView {
    struct Component: ConnectedView {

        struct Props {
            let value: Double
            let filter: TransactionFilter
            let dispatch: DispatchFunction
        }

        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            let value = state.transactionsState.filteredTransactions.reduce(0) { (result, transaction) -> Double in
                result + transaction.value
            }

            return Props(
                value: value,
                filter: state.transactionsState.filter,
                dispatch: dispatch
            )
        }

        func body(props: Props) -> some View {
            HomeView.HeaderView(
                value: props.value,
                filter: props.filter,
                changeFilter: { filter in
                    props.dispatch(TransactionsFeature.Actions.SetFilter(filter: filter))
                }
            )
        }

    }
}
