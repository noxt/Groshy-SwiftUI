//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension CategoriesFeature {
    struct State: FluxState, Codable {

        var selectedCategory: Category.ID?
        var categories: [Category.ID : Category]
        var sortOrder: [Category.ID]
        var isLoading: Bool
        var error: String?


        static let initial = State(
            selectedCategory: nil,
            categories: [:],
            sortOrder: [],
            isLoading: false,
            error: nil
        )

    }
}
