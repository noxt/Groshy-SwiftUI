//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct KeyboardView: ConnectedView {

    struct Props {
        let dispatch: DispatchFunction
    }


    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
            dispatch: dispatch
        )
    }

    func body(props: Props) -> some View {
        VStack(spacing: 7) {
            HStack(spacing: 7) {
                DigitButton(title: "7", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 7))
                })
                DigitButton(title: "8", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 8))
                })
                DigitButton(title: "9", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 9))
                })
            }

            HStack(spacing: 7) {
                DigitButton(title: "4", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 4))
                })
                DigitButton(title: "5", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 5))
                })
                DigitButton(title: "6", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 6))
                })
            }

            HStack(spacing: 7) {
                DigitButton(title: "1", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 1))
                })
                DigitButton(title: "2", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 2))
                })
                DigitButton(title: "3", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 3))
                })
            }

            HStack(spacing: 7) {
                DigitButton(title: ",", action: {
                    props.dispatch(KeyboardFeature.Actions.AddComma())
                })
                DigitButton(title: "0", action: {
                    props.dispatch(KeyboardFeature.Actions.AddDigit(digit: 0))
                })
                DeleteButton(
                    action: {
                        props.dispatch(KeyboardFeature.Actions.RemoveLastSymbol())
                    },
                    longPressAction: {
                        props.dispatch(KeyboardFeature.Actions.RemoveAll())
                    }
                )
            }
        }
    }

}
