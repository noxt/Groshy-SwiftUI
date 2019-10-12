//
//  Created by Dmitry Ivanenko on 12.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


struct Transaction: Codable, Identifiable {
    let id: UUID
    let categoryID: Category.ID
    let hashtagID: Hashtag.ID?
    let value: Double
    let date: Date
}
