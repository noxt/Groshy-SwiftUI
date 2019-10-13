//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIFlux


struct AddHashtagView: ConnectedView {

    struct Props {

    }

    @Binding var isPresented: Bool
    @State private var hashtagValue = ""

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
        )
    }

    func body(props: AddHashtagView.Props) -> some View {
        VStack {
            HStack {
                ImageButton(image: Image.Buttons.cancel, action: { self.isPresented = false })
                    .offset(x: -10, y: -10)
                Spacer()
                ImageButton(image: Image.Buttons.save, action: { print(self.hashtagValue) })
                    .offset(x: 10, y: -10)
            }

            Spacer()

            HStack {
                Text("#")
                    .font(Font.Rubik.Medium(size: 48))
                    .foregroundColor(.primaryColor)

                TextField("Hashtag", text: $hashtagValue)
                    .keyboardType(.default)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .font(Font.Rubik.Medium(size: 48))
                    .foregroundColor(.label)
            }

            Spacer()

            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "Корона"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "BigZ"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "NYX"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "Газпром"))
                    }

                    HStack {
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "KFC"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "Burger King"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "MC Donalds"))
                        HashtagView(hashtag: Hashtag(id: UUID(), title: "Salateira"))
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -16)

        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

}
