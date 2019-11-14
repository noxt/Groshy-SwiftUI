//
//  Created by Dmitry Ivanenko on 11/12/19.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


extension Array where Element: RandomAccessCollection {

    struct IdentityItem: Identifiable {
        let id: Int
        var elements: Element
    }

    func mapToIdentity() -> [IdentityItem] {
        return self.enumerated().map(IdentityItem.init)
    }

}
