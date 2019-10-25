//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension Category {
    struct Style: Codable, Hashable {
        let number: Int
    }
}


extension Category.Style {

    static var allCases: [Self] {
        return (1...16).map { (number) -> Self in
            Self(number: number)
        }
    }

    static func random() -> Self {
        return allCases.randomElement()!
    }

    var primaryColor: Color {
        return Color.category(number)
    }

}
