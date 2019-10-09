//
//  Created by Dmitry Ivanenko on 09.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.03 : 1)
            .animation(Animation.spring().speed(2))
    }
}
