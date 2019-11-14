//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct AddHashtagView: View {

    @State private var title = ""

    let isEmptyHashtags: Bool
    let hashtags: [Hashtag]
    let createHashtagAction: (String) -> Void
    let selectHashtagAction: (Hashtag) -> Void
    let dismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                ImageButton(image: Image.Buttons.cancel, action: dismiss)
                    .offset(x: -10, y: -10)
                Spacer()
                ImageButton(image: Image.Buttons.save, action: saveHashtag)
                    .offset(x: 10, y: -10)
                    .disabled(title.isEmpty)
                    .opacity(title.isEmpty ? 0.7 : 1)
            }

            Spacer()

            HStack {
                Text("#")
                    .font(Font.Rubik.Medium(size: 32))
                    .foregroundColor(.primaryColor)

                TextField("Хэштег", text: $title, onCommit: saveHashtag)
                    .keyboardType(.default)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .font(Font.Rubik.Bold(size: 30))
                    .foregroundColor(.label)
            }

            Spacer()

            if !isEmptyHashtags {
                HashtagsGridView(hashtags: hashtags, selectHashtagAction: selectHashtagAction)
            }
        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

    private func saveHashtag() {
        createHashtagAction(title)
    }

}
