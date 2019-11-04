//
//  Created by Dmitry Ivanenko on 11/1/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI



struct StatisticsView: View {

    @Binding var isStatisticsPresented: Bool

    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Button(action: { self.isStatisticsPresented = false }) {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                    }
                    Text("Статистика")
                    Spacer()
                }
                Spacer()
            }
        }
    }

}
