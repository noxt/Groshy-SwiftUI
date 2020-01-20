//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension AddHashtagView {
    struct HashtagsGridView: View {

        let hashtags: [Hashtag]
        let selectHashtagAction: (Hashtag) -> Void
        
        var body: some View {
            let rows = hashtags.splitByRows(numberOfRows: 3).mapToIdentity()

            return ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(rows) { row in
                        Row(
                            hashtags: row.elements,
                            selectHashtagAction: self.selectHashtagAction
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -16)
        }

    }
}
