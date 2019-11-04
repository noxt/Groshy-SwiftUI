//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct HomeView: View {

    var showSettings: () -> Void
    var showStatistics: () -> Void

    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack(alignment: .bottom) {
                    HomeHeaderViewComponent()

                    VStack(spacing: 0) {
                        Button(action: showSettings) {
                            ZStack {
                                Image.Buttons.settings
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.button)
                                    .offset(x: 0, y: 5)
                            }
                            .frame(width: 40, height: 40)
                        }

                        Button(action: showStatistics) {
                            ZStack {
                                Image.Buttons.statistics
                                    .resizable()
                                    .frame(width: 18, height: 12)
                                    .foregroundColor(.button)
                            }
                            .frame(width: 40, height: 40)
                        }
                    }
                    .padding(EdgeInsets(top: -15, leading: 0, bottom: -5, trailing: -8))
                }

                Spacer()

                CategoriesGridViewComponent()

                Spacer()

                HomeBottomViewComponent()
            }
            .padding(16)
        }
    }

}
