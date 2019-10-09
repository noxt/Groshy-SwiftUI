//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension KeyboardFeature {
    static func reduce(state: State, action: Action) -> State {
        var state = state

        switch action {

        case let action as Actions.AddDigit:
            if state.currentValue == "0" {
                state.currentValue = String(action.digit)
            } else {
                state.currentValue.append(String(action.digit))
            }

        case is Actions.AddComma:
            guard let commaCharacter = NumberFormatter().decimalSeparator,
                state.currentValue.firstIndex(of: commaCharacter.first!) == nil else {
                    break
            }

            if state.currentValue.isEmpty {
                state.currentValue.append("0")
            }
            state.currentValue.append(commaCharacter)

        case is Actions.RemoveLastSymbol:
            state.currentValue.removeLast()
            if state.currentValue.isEmpty {
                state.currentValue = "0"
            }

        case is Actions.RemoveAll:
            state.currentValue = "0"

        default:
            break
        }

        return state
    }
}
