//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddHashtagView.HashtagsGridView {
    struct Row: View {

        let hashtags: [Hashtag]
        let selectHashtagAction: (Hashtag) -> Void

        var body: some View {
            HStack(spacing: 8) {
                ForEach(hashtags) { hashtag in
                    Item(title: hashtag.title)
                        .onTapGesture {
                            self.selectHashtagAction(hashtag)
                        }
                }
            }
        }
    }
}
