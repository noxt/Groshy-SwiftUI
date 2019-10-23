//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct BigPrimaryButton: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(Font.Rubik.Medium(size: 17))
                    .foregroundColor(.background)
                Spacer()
            }
            .frame(height: height)
            .background(Color.primaryColor)
            .cornerRadius(12)
        }
        .buttonStyle(ScaledButtonStyle())
    }

    private var height: CGFloat {
        return 50
    }

}


// MARK: - PreviewProvider

struct BigPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        BigPrimaryButton(title: "Title", action: {})
    }
}
