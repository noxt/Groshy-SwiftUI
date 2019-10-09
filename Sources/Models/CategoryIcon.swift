//
//  Created by Dmitry Ivanenko on 06/10/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


extension Category {
    enum Icon: String, CaseIterable, Codable {
        case car
        case entertaiment
        case presents
        case products
        case restaurants
        case shops
        case baby
        case bus
        case chair
        case computer
        case cosmetics
        case discount
        case dumbbell
        case farm
        case file
        case fireworks
        case graduation
        case health
        case home
        case microphone
        case music
        case paw
        case plane
        case puzzle
        case settings
        case sneaker
        case tShirt
        case taxi
        case telephone
        case toy
        case video

        static func random() -> Icon {
            return Icon.allCases.randomElement()!
        }
    }
}


extension Category.Icon {
    var image: Image {
        switch self {
        case .car:
            return Image.Categories.car
        case .entertaiment:
            return Image.Categories.entertaiment
        case .presents:
            return Image.Categories.presents
        case .products:
            return Image.Categories.products
        case .restaurants:
            return Image.Categories.restaurants
        case .shops:
            return Image.Categories.shops
        case .baby:
            return Image.Categories.baby
        case .bus:
            return Image.Categories.bus
        case .chair:
            return Image.Categories.chair
        case .computer:
            return Image.Categories.computer
        case .cosmetics:
            return Image.Categories.cosmetics
        case .discount:
            return Image.Categories.discount
        case .dumbbell:
            return Image.Categories.dumbbell
        case .farm:
            return Image.Categories.farm
        case .file:
            return Image.Categories.file
        case .fireworks:
            return Image.Categories.fireworks
        case .graduation:
            return Image.Categories.graduation
        case .health:
            return Image.Categories.health
        case .home:
            return Image.Categories.home
        case .microphone:
            return Image.Categories.microphone
        case .music:
            return Image.Categories.music
        case .paw:
            return Image.Categories.paw
        case .plane:
            return Image.Categories.plane
        case .puzzle:
            return Image.Categories.puzzle
        case .settings:
            return Image.Categories.settings
        case .sneaker:
            return Image.Categories.sneaker
        case .tShirt:
            return Image.Categories.tShirt
        case .taxi:
            return Image.Categories.taxi
        case .telephone:
            return Image.Categories.telephone
        case .toy:
            return Image.Categories.toy
        case .video:
            return Image.Categories.video
        }
    }
}
