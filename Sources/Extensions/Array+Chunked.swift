//
//  Created by Dmitry Ivanenko on 08.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


extension Array {

    func chunked(into size: Int) -> [[Element]] {
        guard self.count > 0 else {
            return []
        }
        
        var chunkedArray = [[Element]]()

        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if (index == self.count) {
                chunkedArray.append(Array(self[index-1..<index]))
            }
        }

        return chunkedArray
    }

}
