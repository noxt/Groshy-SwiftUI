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
        let chunkedCategories = props.categoriesIds.chunked(into: 4)
        var topItems: [Category.ID] = []
        if chunkedCategories.count > 0 {
            topItems = chunkedCategories[0]
        }

        var bottomItems: [Category.ID] = []
        if chunkedCategories.count > 1 {
            bottomItems = chunkedCategories[1]
        }

        return VStack(spacing: 9) {
            Row(categoriesIds: topItems)
            Row(categoriesIds: bottomItems)
        }
        .onAppear {
            props.dispatch(CategoriesFeature.Actions.LoadCategories())
        }
    }

}
