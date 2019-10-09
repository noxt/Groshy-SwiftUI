//
//  Created by Dmitry Ivanenko on 08.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension CategoriesGridView {
    struct Row: ConnectedView {

        struct Props {
            let categoriesIds: [Category.ID]
        }
        
        let categoriesIds: [Category.ID]

        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            return Props(
                categoriesIds: categoriesIds
            )
        }

        func body(props: Props) -> some View {
            HStack(spacing: 10) {
                ForEach(props.categoriesIds, id: \.self) { id in
                    Cell(categoryId: id)
                }
            }
        }
    }
}
