//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIFlux


struct AddHashtagViewComponent: ConnectedView {

    struct Props {
        let isEmptyHashtags: Bool
        let hashtagsRows: [AddHashtagView.Row]
        let createHashtagAction: ((String) -> Void)
        let selectHashtagAction: ((Hashtag) -> Void)
    }

    @Environment(\.presentationMode) var presentation

    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        let hashtags = state.hashtagsState.hashtags.values.sorted { (a, b) -> Bool in
            a.title < b.title
        }

        return Props(
            isEmptyHashtags: hashtags.isEmpty,
            hashtagsRows: splitHashtagsByRows(hashtags: hashtags),
            createHashtagAction: { title in
                guard let hashtag = self.createHashtag(with: title, hashtags: hashtags) else {
                    return
                }
                dispatch(HashtagsFeature.Actions.SaveHashtag(hashtag: hashtag))
                self.dismiss()
            },
            selectHashtagAction: { hashtag in
                dispatch(HashtagsFeature.Actions.SelectHashtag(id: hashtag.id))
                self.dismiss()
            }
        )
    }

    func body(props: Props) -> some View {
        AddHashtagView(
            isEmptyHashtags: props.isEmptyHashtags,
            hashtagsRows: props.hashtagsRows,
            createHashtagAction: props.createHashtagAction,
            selectHashtagAction: props.selectHashtagAction,
            dismiss: dismiss
        )
    }

    private func splitHashtagsByRows(hashtags: [Hashtag], numberOfRows: Int = 3) -> [AddHashtagView.Row] {
        var rows: [AddHashtagView.Row] = []
        for id in 0..<numberOfRows {
            rows.append(AddHashtagView.Row(id: id, hashtags: []))
        }
        for (index, hashtag) in hashtags.enumerated() {
            rows[index % numberOfRows].hashtags.append(hashtag)
        }
        return rows
    }

    private func createHashtag(with title: String, hashtags: [Hashtag]) -> Hashtag? {
        guard !title.isEmpty else {
            return nil
        }

        if let hashtag = hashtags.first(where: { $0.title == title }) {
            return hashtag
        } else {
            return Hashtag(id: UUID(), title: title)
        }
    }

    private func dismiss() {
        presentation.wrappedValue.dismiss()
    }

}


struct AddHashtagView: View {

    struct Row: Identifiable {
        let id: Int
        var hashtags: [Hashtag]
    }

    @State private var title = ""

    let isEmptyHashtags: Bool
    let hashtagsRows: [Row]
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
                HashtagsListView()
            }
        }
        .padding(16)
        .background(Color.background)
        .modifier(AdaptsToSoftwareKeyboard())
    }

    private func saveHashtag() {
        createHashtagAction(title)
    }

    private func HashtagsListView() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(hashtagsRows) { row in
                    self.HashtagsListRow(hashtags: row.hashtags)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, -16)
    }

    private func HashtagsListRow(hashtags: [Hashtag]) -> some View {
        HStack(spacing: 8) {
            ForEach(hashtags) { hashtag in
                HashtagView(hashtag: hashtag)
                    .onTapGesture {
                        self.selectHashtagAction(hashtag)
                    }
            }
        }
    }

}
