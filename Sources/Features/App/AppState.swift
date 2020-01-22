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

        static let initial = State(
            keyboardState: .initial,
            categoriesState: .initial,
            transactionsState: .initial,
            hashtagsState: .initial
        )
    }
}


// MARK: - Archive

extension AppFeature.State {

    static func loadFromArchive() -> Self? {
        do {
            savePath = try FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false)

            if let iCloudDirectory = FileManager.default.url(forUbiquityContainerIdentifier: nil) {
                savePath = iCloudDirectory
                try FileManager.default.startDownloadingUbiquitousItem(at: iCloudDirectory)
            }

            savePath = savePath.appendingPathComponent("userData")
        } catch let error {
            fatalError("Couldn't create save state data with error: \(error)")
        }

        guard let data = try? Data(contentsOf: savePath), let savedState = try? decoder.decode(Self.self, from: data) else {
            return nil
        }

        return savedState
    }

    static func archive(state: AppFeature.State) {
        DispatchQueue.global().async {
            guard let data = try? encoder.encode(state) else {
                return
            }
            do {
                try data.write(to: savePath, options: .completeFileProtection)
            } catch let error {
                print("Error while saving app state :\(error)")
            }
        }
    }

}
