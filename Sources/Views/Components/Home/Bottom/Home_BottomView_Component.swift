//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension HomeView.BottomView {
    struct Component: ConnectedView {

        struct Props {
            let currentValue: String
            let isHashtagSelected: Bool
            let transaction: Transaction?
            let dispatch: DispatchFunction
        }


        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            return Props(
                currentValue: state.keyboardState.currentValue,
                isHashtagSelected: state.hashtagsState.selectedHashtag != nil,
                transaction: createTransaction(for: state),
                dispatch: dispatch
            )
        }

        private func createTransaction(for state: AppFeature.State) -> Transaction? {
            guard let categoryID = state.categoriesState.selectedCategory,
                let value = NumberFormatter.currency.number(from: state.keyboardState.currentValue),
                value.doubleValue > 0 else {
                    return nil
            }

            return Transaction(
                id: UUID(),
                categoryID: categoryID,
                hashtagID: state.hashtagsState.selectedHashtag,
                value: value.doubleValue,
                date: Date()
            )
        }

        func body(props: Props) -> some View {
            var createTransaction: (() -> Void)?
            if let transaction = props.transaction {
                createTransaction = {
                    props.dispatch(TransactionsFeature.Actions.SaveTransaction(transaction: transaction))
                }
            }

            return HomeView.BottomView(
                currentValue: props.currentValue,
                isHashtagSelected: props.isHashtagSelected,
                createTransaction: createTransaction
            )
        }

    }

}
