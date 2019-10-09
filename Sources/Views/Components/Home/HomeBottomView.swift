//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct HomeBottomView: ConnectedView {

    struct Props {
        let currentValue: String
    }

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
            currentValue: state.keyboardState.currentValue
        )
    }

    func body(props: Props) -> some View {
        VStack(spacing: 7) {
            HStack(spacing: 4) {
                CurrentTransactionValueView(title: props.currentValue)
                AddHashtagButton(action: {})
            }

            KeyboardView()

            HStack(spacing: 0) {
                ImageButton(image: Image.Buttons.calendar, action: {})
                BigPrimaryButton(title: "Зачислить", action: {})
            }
        }
    }

}
