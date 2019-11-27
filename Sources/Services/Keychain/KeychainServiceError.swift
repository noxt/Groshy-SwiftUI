//
//  Created by Dmitry Ivanenko on 16.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


enum KeychainServiceError: Error {

    case encodingError
    case decodingError

    case savingError
    case gettingError
    case deletingError

}
