//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct CategoriesGridView: ConnectedView {

    struct Props {
        let categoriesIds: [Category.ID]
        let dispatch: DispatchFunction
    }


    func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
            categoriesIds: state.categoriesState.sortOrder,
            dispatch: dispatch
        )
    }

    func body(props: Props) -> some View {
        var topItems: [Category.ID] = []
        var bottomItems: [Category.ID] = []

        for (index, id) in props.categoriesIds.enumerated() {
            if index % 2 == 0 {
                topItems.append(id)
            } else {
                bottomItems.append(id)
            }
        }

        return ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 9) {
                Row(items: topItems, showAddButton: props.categoriesIds.count % 2 == 0)
                Row(items: bottomItems, showAddButton: props.categoriesIds.count % 2 == 1)
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, -16)
        .onAppear {
            props.dispatch(CategoriesFeature.Actions.LoadCategories())
        }
    }

}
