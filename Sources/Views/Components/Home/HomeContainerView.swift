//
//  Created by Dmitry Ivanenko on 11/1/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct HomeContainerView: View {

    @EnvironmentObject var store: Store<AppFeature.State>
    @State private var isStatisticsPresented = false

    var body: some View {
        ZStack {
            HomeView(
                showSettings: {

                },
                showStatistics: {
                    withAnimation(.spring()) {
                        self.isStatisticsPresented.toggle()
                    }
                }
            )

            if isStatisticsPresented {
                StatisticsView(isStatisticsPresented: $isStatisticsPresented)
                    .transition(.moveAndFade)
            }
        }
        .onAppear {
            self.store.dispatch(action: CategoriesFeature.Actions.LoadCategories())
            self.store.dispatch(action: TransactionsFeature.Actions.LoadTransactions())
            self.store.dispatch(action: HashtagsFeature.Actions.LoadHashtags())
        }
    }

}


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
