//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


struct Category: Codable, Identifiable {
    var id: UUID
    var title: String
    var icon: Icon
    var style: Style
}
