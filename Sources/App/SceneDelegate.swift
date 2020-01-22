//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftUIFlux
import Combine


let store = Store<AppFeature.State>(
    reducer: AppFeature.reduce,
    middleware: [loggingMiddleware],
    state: AppFeature.State.loadFromArchive() ?? AppFeature.State.initial
)


final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var archiveTimer: Timer?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let controller = UIHostingController(rootView:
                StoreProvider(store: store) {
                    HomeView.Component()
                }
            )

            window.rootViewController = controller
            self.window = window
            window.makeKeyAndVisible()

            archiveTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true, block: { a in
                AppFeature.State.archive(state: store.state)
//                store.dispatch(action: AppFeature.Actions.SaveState())
            })
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
//        store.dispatch(action: AppFeature.Actions.SaveState())
        AppFeature.State.archive(state: store.state)
        store.dispatch(action: AppFeature.Actions.DidEnterBackground())
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        store.dispatch(action: AppFeature.Actions.WillEnterForeground())
    }

}
