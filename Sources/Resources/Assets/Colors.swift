//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension Color {
    static let background = Color("Colors/Background")
    static let secondaryBackground = Color("Colors/Secondary Background")
    static let button = Color("Colors/Button")
    static let focused = Color("Colors/Focused")
    static let label = Color("Colors/Label")
    static let secondaryLabel = Color("Colors/Secondary Label")
    static let primaryColor = Color("Colors/Primary")
    static let secondary = Color("Colors/Secondary")


    enum Categories {
        static let plusTitle = Color("Colors/Categories/Plus Title")
        static let plusIcon = Color("Colors/Categories/Plus Icon")
    }

    static func category(_ index: Int) -> Color {
        return Color("Colors/Categories/Style \(index)")
    }

}
