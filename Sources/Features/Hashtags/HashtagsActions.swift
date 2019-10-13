//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension HashtagsFeature {
    enum Actions {
        struct LoadHashtags: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {

            }
        }

        struct SetHastags: Action {
            let hashtags: [Hashtag]
        }

        struct SelectHashtag: Action {
            let id: Hashtag.ID
        }

        struct ClearSelectedHashtag: Action {
            
        }

    }
}
