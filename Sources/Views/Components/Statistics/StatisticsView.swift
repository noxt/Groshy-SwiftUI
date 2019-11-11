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
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.button)
                    }
                    Text("Статистика")
                        .font(.title)
                        .foregroundColor(.label)
                    Spacer()
                }
                Spacer()
            }
            .padding(16)
        }
    }

}


#if DEBUG
struct StatisticsView_Preview: PreviewProvider {
    @State static private var isStatisticsPresented = true
    static var previews: some View {
        StatisticsView(isStatisticsPresented: $isStatisticsPresented)
            .previewLayout(.sizeThatFits)
    }
}
#endif
