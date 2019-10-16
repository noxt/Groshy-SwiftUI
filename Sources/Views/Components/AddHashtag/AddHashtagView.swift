//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIFlux


struct AddHashtagView: ConnectedView {

    struct Props {
        let hashtags: [Hashtag]
        let createHashtagAction: Action?
        let dispatch: DispatchFunction
    }

    @Binding var isPresented: Bool
    @State private var hashtagValue = ""

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        var createHashtagAction: Action?
        if let hashtag = createHashtag(for: state) {
            createHashtagAction = HashtagsFeature.Actions.SaveHashtag(hashtag: hashtag)
        }
        return Props(
            hashtags: Array(state.hashtagsState.hashtags.values),
            createHashtagAction: createHashtagAction,
            dispatch: dispatch
        )
    }

    private func createHashtag(for state: AppFeature.State) -> Hashtag? {
        guard !hashtagValue.isEmpty else {
            return nil
        }

        if let hashtag = state.hashtagsState.hashtags.values.first(where: { $0.title == hashtagValue }) {
            return hashtag
        } else {
            return Hashtag(id: UUID(), title: hashtagValue)
        }
    }

    func body(props: AddHashtagView.Props) -> some View {
        VStack {
            HStack {
                ImageButton(image: Image.Buttons.cancel, action: { self.isPresented = false })
                    .offset(x: -10, y: -10)
                Spacer()
                ImageButton(image: Image.Buttons.save, action: {
                    if let action = props.createHashtagAction {
                        props.dispatch(action)
                        self.isPresented = false
                    }
                })
                    .offset(x: 10, y: -10)
                    .disabled(props.createHashtagAction == nil)
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

            if !props.hashtags.isEmpty {
                HashtagsListView(for: props)
            }
        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

    private func HashtagsListView(for props: Props) -> some View {
        var topHashtags: [Hashtag] = []
        var bottomHashtags: [Hashtag] = []
        for (index, hashtag) in props.hashtags.enumerated() {
            if index % 2 == 0 {
                topHashtags.append(hashtag)
            } else {
                bottomHashtags.append(hashtag)
            }
        }

        return ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading) {
                HashtagsListRow(for: props, hashtags: topHashtags)
                HashtagsListRow(for: props, hashtags: bottomHashtags)
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, -16)
    }

    private func HashtagsListRow(for props: Props, hashtags: [Hashtag]) -> some View {
        HStack {
            ForEach(hashtags) { hashtag in
                HashtagView(hashtag: hashtag)
                    .onTapGesture {
                        props.dispatch(HashtagsFeature.Actions.SelectHashtag(id: hashtag.id))
                        self.isPresented = false
                    }
            }
        }
    }

}
