//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension HashtagsFeature {
    struct State: FluxState, Codable {

        var hashtags: [Hashtag.ID: Hashtag]
        var selectedHashtag: Hashtag.ID?

        static let initial = State(
            hashtags: [:],
            selectedHashtag: nil
        )

    }
}
