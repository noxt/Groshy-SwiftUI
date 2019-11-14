//
//  Created by Dmitry Ivanenko on 06.11.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import Foundation


#if true
let serviceLocator = ServiceLocator()
#else
let serviceLocator = MockServiceLocator()
#endif


protocol ServiceLocatorProtocol {
    func run()
}



class ServiceLocator: ServiceLocatorProtocol {
    func run() {
        print("run")
    }
}


class MockServiceLocator: ServiceLocatorProtocol {
    func run() {
        print("mock run")
    }
}
