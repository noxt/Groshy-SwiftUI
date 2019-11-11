//
//  Created by Dmitry Ivanenko on 13.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct HashtagView: View {

    let title: String

    var body: some View {
        HStack(spacing: 4) {
            Text("#")
                .font(Font.Rubik.Bold(size: 17))
                .foregroundColor(.button)
            Text(title)
                .font(Font.Rubik.Bold(size: 17))
                .foregroundColor(.secondaryLabel)
        }
        .padding(8)
        .background(Color.secondaryBackground)
        .cornerRadius(12)
        .buttonStyle(ScaledButtonStyle())
    }

}


#if DEBUG
struct HashtagView_Preview: PreviewProvider {
    static var previews: some View {
        HashtagView(title: "Hashtag")
            .previewLayout(.sizeThatFits)
            .padding(8)
    }
}
#endif
