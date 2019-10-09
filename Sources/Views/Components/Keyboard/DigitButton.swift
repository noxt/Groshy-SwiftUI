//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension KeyboardView {
    struct DigitButton: View {

        let title: String
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Text(title)
                    .foregroundColor(.secondaryLabel)
                    .font(Font.Rubik.Regular(size: 25))
                    .frame(height: 47)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.secondaryBackground)
                    .cornerRadius(4)
            }
            .buttonStyle(ScaledButtonStyle())
        }

    }
}
