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


extension TransactionFilter {
    var title: String {
        switch self {
        case .perDay:
            return "за день"
        case .perWeek:
            return "за неделю"
        case .perMonth:
            return "за месяц"
        case .perYear:
            return "за год"
        case .allTime:
            return "за все время"
        }
    }
}
