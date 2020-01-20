//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension HomeView {
    struct BottomView: View {

        let currentValue: String
        let isHashtagSelected: Bool
        let createTransaction: (() -> Void)?

        @State private var isAddingHashtagPresented = false
        @State private var isDatePickerPresented = false
        @State private var selectedDate = Date()

        var body: some View {
            ZStack {
                VStack(spacing: 7) {
                    HStack(spacing: 4) {
                        CurrentTransactionValueView(title: currentValue)
                        AddHashtagButton(
                            isSelected: isHashtagSelected,
                            action: {
                                self.isAddingHashtagPresented = true
                            }
                        )
                            .sheet(isPresented: $isAddingHashtagPresented) {
                                AddHashtagView.Component().environmentObject(store)
                            }
                    }

                    KeyboardView.Component()

                    HStack(spacing: 0) {
                        ImageButton(image: Image.Buttons.calendar, action: {
                            withAnimation {
                                self.isDatePickerPresented = true
                            }
                        })
                        BigPrimaryButton(title: "Зачислить", action: {
                            self.createTransaction?()
                        })
                            .disabled(createTransaction == nil)
                            .opacity(createTransaction == nil ? 0.7 : 1)
                    }
                }
            }
        }

    }

}
