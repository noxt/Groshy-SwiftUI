//
//  Created by Dmitry Ivanenko on 22/09/2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI


struct KeyboardView: View {

    let selectDigit: (Int) -> Void
    let addComma: () -> Void
    let removeLast: () -> Void
    let removeAll: () -> Void

    var body: some View {
        VStack(spacing: 7) {
            HStack(spacing: 7) {
                DigitButton(title: "7", action: { self.selectDigit(7) })
                DigitButton(title: "8", action: { self.selectDigit(8) })
                DigitButton(title: "9", action: { self.selectDigit(9) })
            }

            HStack(spacing: 7) {
                DigitButton(title: "4", action: { self.selectDigit(4) })
                DigitButton(title: "5", action: { self.selectDigit(5) })
                DigitButton(title: "6", action: { self.selectDigit(6) })
            }

            HStack(spacing: 7) {
                DigitButton(title: "1", action: { self.selectDigit(1) })
                DigitButton(title: "2", action: { self.selectDigit(2) })
                DigitButton(title: "3", action: { self.selectDigit(3) })
            }

            HStack(spacing: 7) {
                DigitButton(title: NumberFormatter.currency.decimalSeparator, action: addComma)
                DigitButton(title: "0", action: { self.selectDigit(0) })
                DeleteButton(action: removeLast, longPressAction: removeAll)
            }
        }
    }

}


#if DEBUG
struct KeyboardView_Preview: PreviewProvider {
    static var previews: some View {
        KeyboardView(
            selectDigit: { _ in },
            addComma: { },
            removeLast: { },
            removeAll: { }
        )
            .previewLayout(.sizeThatFits)
            .padding(8)
    }
}
#endif
