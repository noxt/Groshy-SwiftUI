//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct ImageButton: View {

    var image: Image
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                image
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.button)
            }
            .frame(width: 50, height: 50)
        }
        .buttonStyle(ScaledButtonStyle())
    }
}


// MARK: - PreviewProvider

struct ImagedButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(image: Image.Buttons.calendar, action: {})
    }
}
