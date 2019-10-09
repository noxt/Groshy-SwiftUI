//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


extension KeyboardFeature {
    enum Actions {

        struct AddDigit: Action {
            let digit: Digit
        }

        struct AddComma: Action {

        }

        struct RemoveLastSymbol: Action {

        }

        struct RemoveAll: Action {

        }

    }
}
