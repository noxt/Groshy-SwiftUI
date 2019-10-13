//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension AppFeature {
    struct State: FluxState, Codable {
        var keyboardState: KeyboardFeature.State
        var categoriesState: CategoriesFeature.State
        var transactionsState: TransactionsFeature.State
        var hashtagsState: HashtagsFeature.State

        static let initial = State(
            keyboardState: .initial,
            categoriesState: .initial,
            transactionsState: .initial,
            hashtagsState: .initial
        )
    }
}
