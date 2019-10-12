//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation

extension NumberFormatter {

    static var currency: NumberFormatter {
        let numberFormatter = byn
        numberFormatter.currencyCode = ""
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }

    static var byn: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }

}
