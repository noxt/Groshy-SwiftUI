//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension HashtagsFeature {
    enum Actions {

        struct SaveHashtag: Action {
            let hashtag: Hashtag
        }

        struct LoadHashtags: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                let hashtags = [
                    Hashtag(id: UUID(), title: "BigZ"),
                    Hashtag(id: UUID(), title: "Корона"),
                    Hashtag(id: UUID(), title: "Green"),
                    Hashtag(id: UUID(), title: "Газпром"),
                    Hashtag(id: UUID(), title: "Доставка"),
                    Hashtag(id: UUID(), title: "Salateira"),
                ]
                dispatch(Actions.SetHastags(hashtags: hashtags))
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
