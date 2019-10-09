//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension HomeBottomView {
    struct AddHashtagButton: View {

        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Text("#")
                    .font(Font.Rubik.Medium(size: 32))
                    .foregroundColor(.button)
                    .frame(width: 50, height: 50)
                    .background(Color.background)
            }
            .buttonStyle(ScaledButtonStyle())
        }

    }
}
