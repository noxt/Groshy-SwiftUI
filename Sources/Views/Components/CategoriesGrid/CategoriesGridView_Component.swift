//
//  Created by Dmitry Ivanenko on 03/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension CategoriesGridView {
    struct Component: ConnectedView {

        struct Props {
            let categories: [Category.ID]
            let dispatch: DispatchFunction
        }

        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            Props(
                categories: state.categoriesState.sortOrder,
                dispatch: dispatch
            )
        }

        func body(props: Props) -> some View {
            CategoriesGridView(
                categories: props.categories
            )
        }

    }
}
