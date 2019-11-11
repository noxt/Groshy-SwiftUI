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
        HomeView(
            showSettings: {
            },
            showStatistics: {
                self.isStatisticsPresented.toggle()
            }
        )
        .onAppear {
            self.store.dispatch(action: CategoriesFeature.Actions.LoadCategories())
            self.store.dispatch(action: TransactionsFeature.Actions.LoadTransactions())
            self.store.dispatch(action: HashtagsFeature.Actions.LoadHashtags())
        }
        .sheet(isPresented: $isStatisticsPresented) {
            StatisticsView(isStatisticsPresented: self.$isStatisticsPresented)
        }
    }

}
