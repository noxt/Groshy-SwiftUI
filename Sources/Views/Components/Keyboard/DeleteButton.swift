//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension KeyboardView {
    struct DeleteButton: View {

        let action: () -> Void
        let longPressAction: () -> Void

        var body: some View {
            Button(action: action) {
                Image.Buttons.delete
                    .foregroundColor(.secondaryLabel)
                    .frame(height: 47)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.secondaryBackground)
                    .cornerRadius(4)
                    .onTapGesture(perform: action)
                    .onLongPressGesture(perform: longPressAction)
            }
            .buttonStyle(ScaledButtonStyle())
        }

    }
}
