//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


fileprivate var savePath: URL!
fileprivate let encoder = JSONEncoder()
fileprivate let decoder = JSONDecoder()


extension AppFeature {
    struct State: FluxState, Codable {
        var keyboardState: KeyboardFeature.State
        var categoriesState: CategoriesFeature.State
        var transactionsState: TransactionsFeature.State
        var hashtagsState: HashtagsFeature.State

        init() {
            do {
                let icloudDirectory = FileManager.default.url(forUbiquityContainerIdentifier: nil)
                let documentDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                    in: .userDomainMask,
                                                                    appropriateFor: nil,
                                                                    create: false)
                if let icloudDirectory = icloudDirectory {
                    try FileManager.default.startDownloadingUbiquitousItem(at: icloudDirectory)
                }

                savePath = (icloudDirectory ?? documentDirectory).appendingPathComponent("userData")
            } catch let error {
                fatalError("Couldn't create save state data with error: \(error)")
            }

            if let data = try? Data(contentsOf: savePath), let savedState = try? decoder.decode(AppFeature.State.self, from: data) {
                self.keyboardState = savedState.keyboardState
                self.categoriesState = savedState.categoriesState
                self.transactionsState = savedState.transactionsState
                self.hashtagsState = savedState.hashtagsState
            } else {
                self.keyboardState = .initial
                self.categoriesState = .initial
                self.transactionsState = .initial
                self.hashtagsState = .initial
            }
        }

        func archiveState() {
            DispatchQueue.global().async {
                guard let data = try? encoder.encode(self) else {
                    return
                }
                do {
                    try data.write(to: savePath)
                } catch let error {
                    print("Error while saving app state :\(error)")
                }
            }
        }

//        static let initial = State(
//            keyboardState: .initial,
//            categoriesState: .initial,
//            transactionsState: .initial,
//            hashtagsState: .initial
//        )
    }
}
