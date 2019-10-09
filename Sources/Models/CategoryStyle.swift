//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension Category {
    struct Style: Codable {
        let number: Int
    }
}


extension Category.Style {

    static func random() -> Self {
        return Self(number: (1...7).randomElement()!)
    }

    var primaryColor: Color {
        return Color.category(number)
    }

}
