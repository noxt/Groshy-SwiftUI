//
//  Created by Dmitry Ivanenko on 10/24/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


extension AddCategoryView {
    struct Component: ConnectedView {

        struct Props {
            let saveCategory: (Category) -> Void
        }

        @Environment(\.presentationMode) var presentation


        func map(state: AppFeature.State, dispatch: @escaping DispatchFunction) -> Props {
            Props(
                saveCategory: { category in
                    dispatch(CategoriesFeature.Actions.SaveCategory(category: category))
                }
            )
        }

        func body(props: Props) -> some View {
            AddCategoryView(
                createCategory: { (title, icon, style) in
                    props.saveCategory(Category(
                        id: UUID(),
                        title: title,
                        icon: icon,
                        style: style
                    ))
                },
                dismiss: {
                    self.presentation.wrappedValue.dismiss()
                }
            )
        }

    }
}
