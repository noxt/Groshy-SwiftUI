//
//  Created by Dmitry Ivanenko on 13.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct HashtagView: View {

    let hashtag: Hashtag

    var body: some View {
        HStack {
            Text("#")
                .font(Font.Rubik.Bold(size: 17))
                .foregroundColor(.primaryColor)
            Text(hashtag.title)
                .font(Font.Rubik.Bold(size: 17))
                .foregroundColor(.label)
        }
        .padding(8)
        .background(Color.secondaryBackground)
        .cornerRadius(4)
        .buttonStyle(ScaledButtonStyle())
    }
}
