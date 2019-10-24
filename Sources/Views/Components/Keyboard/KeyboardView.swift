//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct KeyboardViewComponent: ConnectedView {

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


struct KeyboardView: View {

    let selectDigit: (Int) -> Void
    let addComma: () -> Void
    let removeLast: () -> Void
    let removeAll: () -> Void

    var body: some View {
        VStack(spacing: 7) {
            HStack(spacing: 7) {
                DigitButton(title: "7", action: { self.selectDigit(7) })
                DigitButton(title: "8", action: { self.selectDigit(8) })
                DigitButton(title: "9", action: { self.selectDigit(9) })
            }

            HStack(spacing: 7) {
                DigitButton(title: "4", action: { self.selectDigit(4) })
                DigitButton(title: "5", action: { self.selectDigit(5) })
                DigitButton(title: "6", action: { self.selectDigit(6) })
            }

            HStack(spacing: 7) {
                DigitButton(title: "1", action: { self.selectDigit(1) })
                DigitButton(title: "2", action: { self.selectDigit(2) })
                DigitButton(title: "3", action: { self.selectDigit(3) })
            }

            HStack(spacing: 7) {
                DigitButton(title: NumberFormatter.currency.decimalSeparator, action: addComma)
                DigitButton(title: "0", action: { self.selectDigit(0) })
                DeleteButton(action: removeLast, longPressAction: removeAll)
            }
        }
    }

}
