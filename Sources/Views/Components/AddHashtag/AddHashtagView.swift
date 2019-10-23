//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIFlux


struct AddHashtagView: ConnectedView {

    struct Row: Identifiable {
        let id: Int
        var hashtags: [Hashtag]
    }

    struct Props {
        let isEmptyHashtags: Bool
        let hashtagsRows: [Row]
        let createHashtagAction: Action?
        let dispatch: DispatchFunction
    }

    @Environment(\.presentationMode) var presentation
    @State private var hashtagValue = ""

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        var createHashtagAction: Action?
        if let hashtag = createHashtag(for: state) {
            createHashtagAction = HashtagsFeature.Actions.SaveHashtag(hashtag: hashtag)
        }

        let hashtags = state.hashtagsState.hashtags.values.sorted { (a, b) -> Bool in
            a.title < b.title
        }

        return Props(
            isEmptyHashtags: hashtags.isEmpty,
            hashtagsRows: splitHashtagsByRows(hashtags: hashtags),
            createHashtagAction: createHashtagAction,
            dispatch: dispatch
        )
    }

    private func splitHashtagsByRows(hashtags: [Hashtag], numberOfRows: Int = 3) -> [Row] {
        var rows: [Row] = []
        for id in 0..<numberOfRows {
            rows.append(Row(id: id, hashtags: []))
        }
        for (index, hashtag) in hashtags.enumerated() {
            rows[index % numberOfRows].hashtags.append(hashtag)
        }
        return rows
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
                ImageButton(image: Image.Buttons.cancel, action: { self.dismiss() })
                    .offset(x: -10, y: -10)
                Spacer()
                ImageButton(image: Image.Buttons.save, action: {
                    if let action = props.createHashtagAction {
                        props.dispatch(action)
                        self.dismiss()
                    }
                })
                    .offset(x: 10, y: -10)
                    .disabled(props.createHashtagAction == nil)
            }

            Spacer()

            HStack {
                Text("#")
                    .font(Font.Rubik.Medium(size: 32))
                    .foregroundColor(.primaryColor)

                TextField("Хэштег", text: $hashtagValue)
                    .keyboardType(.default)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .font(Font.Rubik.Bold(size: 30))
                    .foregroundColor(.label)
            }

            Spacer()

            if !props.isEmptyHashtags {
                HashtagsListView(for: props)
            }
        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

    private func dismiss() {
        presentation.wrappedValue.dismiss()
    }

    private func HashtagsListView(for props: Props) -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(props.hashtagsRows) { row in
                    self.HashtagsListRow(for: props, hashtags: row.hashtags)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, -16)
    }

    private func HashtagsListRow(for props: Props, hashtags: [Hashtag]) -> some View {
        HStack(spacing: 8) {
            ForEach(hashtags) { hashtag in
                HashtagView(hashtag: hashtag)
                    .onTapGesture {
                        props.dispatch(HashtagsFeature.Actions.SelectHashtag(id: hashtag.id))
                        self.dismiss()
                    }
            }
        }
    }

}
