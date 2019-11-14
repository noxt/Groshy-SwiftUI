//
//  Created by Dmitry Ivanenko on 11/1/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct StatisticsView: View {

    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    ImageButton(image: Image.Buttons.cancel) {
                        self.presentation.wrappedValue.dismiss()
                    }
                        .offset(x: -10, y: -10)

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
        StatisticsView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
