//
//  Created by Dmitry Ivanenko on 23/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension HomeView.BottomView {
    public struct AddHashtagButton: View {

        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Text("#")
                    .font(Font.Rubik.Medium(size: 32))
                    .foregroundColor(isSelected ? .focused : .button)
                    .frame(width: 50, height: 50)
                    .background(Color.background)
            }
            .buttonStyle(ScaledButtonStyle())
        }

    }
}


// MARK: - PreviewProvider

struct HomeBottomView_AddHashtagButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView.BottomView.AddHashtagButton(
                isSelected: false,
                action: { }
            )

            HomeView.BottomView.AddHashtagButton(
                isSelected: true,
                action: { }
            )
        }
            .previewLayout(.sizeThatFits)
            .padding(8)
    }
}
