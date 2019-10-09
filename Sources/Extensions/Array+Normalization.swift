//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    var normalized: [Array.Element.ID: Array.Element] {
        return Dictionary(uniqueKeysWithValues: self.map({ ($0.id, $0) }))
    }
}
