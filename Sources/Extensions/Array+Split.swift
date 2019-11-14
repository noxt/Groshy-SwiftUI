//
//  Created by Dmitry Ivanenko on 08.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


extension Array {

    func splitByRows(numberOfRows: Int) -> [[Element]] {
        var rows = Array<[Element]>(repeating: [], count: numberOfRows)
        for (index, element) in self.enumerated() {
            rows[index % numberOfRows].append(element)
        }
        return rows
    }

    func splitByGroups(itemsInGroup: Int) -> [[Element]] {
        var groups = [[Element]]()

        if self.count > 0  {
            groups.append([])
        }

        for element in self {
            if groups.last?.count == itemsInGroup {
                groups.append([])
            }
            groups[groups.count-1].append(element)
        }

        return groups
    }

}
