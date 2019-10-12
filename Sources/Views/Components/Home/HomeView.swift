//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct HomeView: View {

    @EnvironmentObject var store: Store<AppFeature.State>


    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack(alignment: .bottom) {
                    HomeHeaderView()

                    VStack(spacing: 0) {
                        Button(action: {}) {
                            HStack(alignment: .bottom) {
                                Image.Buttons.settings
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.button)
                            }
                            .frame(width: 40, height: 40)
                        }

                        Button(action: {}) {
                            ZStack {
                                Image.Buttons.filter
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.button)
                            }
                            .frame(width: 40, height: 40)
                        }
                    }
                    .padding(EdgeInsets(top: -16, leading: 0, bottom: 0, trailing: -8))
                }

                Spacer()

                CategoriesGridView()

                Spacer()

                HomeBottomView()
            }
            .padding(16)
        }
        .onAppear {
            self.store.dispatch(action: TransactionsFeature.Actions.LoadTransactions())
        }
    }

}


// MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(store)
    }
}
