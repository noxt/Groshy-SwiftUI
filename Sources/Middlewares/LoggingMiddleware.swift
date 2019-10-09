//
//  Created by Dmitry Ivanenko on 30/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import SwiftUIFlux


let loggingMiddleware: Middleware<AppFeature.State> = { dispatch, getState in
    return { next in
        return { action in
            #if DEBUG
            let name = __dispatch_queue_get_label(nil)
            let queueName = String(cString: name, encoding: .utf8)
            print("#Action: \(String(reflecting: type(of: action))) on queue: \(queueName ?? "??")")
            #endif
            return next(action)
        }
    }
}
