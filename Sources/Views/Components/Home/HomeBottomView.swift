//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct HomeBottomView: ConnectedView {

    struct Props {
        let currentValue: String
        let isHashtagSelected: Bool
        let createTransactionAction: Action?
    }

    @State private var isAddingHashtagPresented = false

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        var action: Action?
        if let transaction = createTransaction(for: state) {
            action = TransactionsFeature.Actions.SaveTransaction(transaction: transaction)
        }

        return Props(
            currentValue: state.keyboardState.currentValue,
            isHashtagSelected: state.hashtagsState.selectedHashtag != nil,
            createTransactionAction: action
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
        VStack(spacing: 7) {
            HStack(spacing: 4) {
                CurrentTransactionValueView(title: props.currentValue)
                AddHashtagButton(
                    isSelected: props.isHashtagSelected,
                    action: {
                        self.isAddingHashtagPresented = true
                    }
                )
            }

            KeyboardView()

            HStack(spacing: 0) {
                ImageButton(image: Image.Buttons.calendar, action: {})
                BigPrimaryButton(title: "Зачислить", action: {
                    if let action = props.createTransactionAction {
                        store.dispatch(action: action)
                    }
                })
                .disabled(props.createTransactionAction == nil)
            }
        }
        .sheet(isPresented: $isAddingHashtagPresented) {
            AddHashtagView(isPresented: self.$isAddingHashtagPresented).environmentObject(store)
        }
    }

}
