//
//  Created by Dmitry Ivanenko on 20.01.2020.
//  Copyright © 2020 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension KeyboardView {
    struct Component: ConnectedView {

        struct Props {
            let selectDigit: (Int) -> Void
            let addComma: () -> Void
            let removeLast: () -> Void
            let removeAll: () -> Void
        }

        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            return Props(
                selectDigit: { digit in
                    dispatch(KeyboardFeature.Actions.AddDigit(digit: digit))
                },
                addComma: {
                    dispatch(KeyboardFeature.Actions.AddComma())
                },
                removeLast: {
                    dispatch(KeyboardFeature.Actions.RemoveLastSymbol())
                },
                removeAll: {
                    dispatch(KeyboardFeature.Actions.RemoveAll())
                }
            )
        }

        func body(props: Props) -> some View {
            KeyboardView(
                selectDigit: props.selectDigit,
                addComma: props.addComma,
                removeLast: props.removeLast,
                removeAll: props.removeAll
            )
        }

    }
}
