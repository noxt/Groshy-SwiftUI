//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


enum TransactionFilter: Int, CaseIterable, Codable {
    case perDay
    case perWeek
    case perMonth
    case perYear
    case allTime
}
