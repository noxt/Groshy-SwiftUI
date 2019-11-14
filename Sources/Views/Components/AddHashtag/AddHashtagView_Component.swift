//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIFlux


extension AddHashtagView {
    struct Component: ConnectedView {

        struct Props {
            let isEmptyHashtags: Bool
            let hashtags: [Hashtag]
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
                hashtags: hashtags,
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
                hashtags: props.hashtags,
                createHashtagAction: props.createHashtagAction,
                selectHashtagAction: props.selectHashtagAction,
                dismiss: dismiss
            )
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
}
