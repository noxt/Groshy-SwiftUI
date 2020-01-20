//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension HomeView.BottomView {
    struct CurrentTransactionValueView: View {

        let title: String

        var body: some View {
            HStack {
                Spacer()
                Text(title)
                    .font(Font.Rubik.Medium(size: 25))
                    .foregroundColor(.label)
                    .padding(.horizontal, 11)
            }
            .frame(height: 50)
            .background(Color.secondaryBackground)
            .cornerRadius(4)
        }

    }
}
