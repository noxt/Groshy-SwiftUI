//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension HashtagsFeature {
    static func reduce(state: State, action: Action) -> State {
        var state = state

        switch action {

        case let action as Actions.SetHastags:
            state.hashtags = action.hashtags.normalized

        case let action as Actions.SelectHashtag:
            state.selectedHashtag = action.id

        case is Actions.ClearSelectedHashtag:
            state.selectedHashtag = nil

        default:
            break
        }
        return state
    }
}
