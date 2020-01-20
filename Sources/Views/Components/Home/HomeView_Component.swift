//
//  Created by Dmitry Ivanenko on 11/1/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension HomeView {
    struct Component: View {

        @EnvironmentObject var store: Store<AppFeature.State>

        var body: some View {
            HomeView()
//                .onAppear {
//                    self.store.dispatch(action: CategoriesFeature.Actions.LoadCategories())
//                    self.store.dispatch(action: TransactionsFeature.Actions.LoadTransactions())
//                    self.store.dispatch(action: HashtagsFeature.Actions.LoadHashtags())
//                }
        }

    }
}
