//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension KeyboardFeature {
    struct State: FluxState, Codable {

        var currentValue: String
        
        static let initial = State(
            currentValue: "0"
        )

    }
}
