//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct HomeView: View {

    @State private var isStatisticsPresented = false

    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack(alignment: .bottom) {
                    HomeHeaderViewComponent()

                    VStack(spacing: 0) {
                        Button(action: {}) {
                            ZStack {
                                Image.Buttons.settings
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.button)
                                    .offset(x: 0, y: 5)
                            }
                            .frame(width: 40, height: 40)
                        }

                        Button(action: { self.isStatisticsPresented = true }) {
                            ZStack {
                                Image.Buttons.statistics
                                    .resizable()
                                    .frame(width: 18, height: 12)
                                    .foregroundColor(.button)
                            }
                            .frame(width: 40, height: 40)
                        }
                        .sheet(isPresented: $isStatisticsPresented) {
                            StatisticsView()
                        }
                    }
                    .padding(EdgeInsets(top: -15, leading: 0, bottom: -5, trailing: -8))
                }

                Spacer()

                CategoriesGridView.Component()

                Spacer()

                HomeBottomViewComponent()
            }
            .padding(16)
        }
    }

}
